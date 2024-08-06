package com.easy.file.service;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.api.dto.FileQueryDTO;
import com.easy.api.vo.FileRecordVO;
import com.easy.api.vo.FileVO;
import com.easy.file.bean.FileRecord;
import com.easy.file.config.MinIoClientConfig;
import com.easy.file.dao.FileRecordMapper;
import com.easy.framework.constant.Constants;
import com.easy.utils.file.FileUtil;
import com.easy.utils.lang.StringUtil;
import io.minio.*;
import io.minio.errors.*;
import io.minio.http.Method;
import io.minio.messages.DeleteError;
import io.minio.messages.DeleteObject;
import io.minio.messages.Item;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * minio文件服务
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Service
@Data
public class MinioFileService extends ServiceImpl<FileRecordMapper, FileRecord> {

    private static final Logger LOGGER = LoggerFactory.getLogger(MinioFileService.class);

    private final MinioClient minioClient;
    private final MinIoClientConfig minIoClientConfig;


    /**
     * description: 判断bucket是否存在，不存在则创建
     */
    public void existBucket(String bucketName) {
        try {
            boolean exists = minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
            if (!exists) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
            }
        } catch (Exception e) {
            LOGGER.error("Minio错误: 判断bucket是否存在 {} 失败", bucketName);
            e.printStackTrace();
        }
    }

    /**
     * 创建存储bucket
     *
     * @param bucketName 存储bucket名称
     * @return Boolean
     */
    public Boolean makeBucket(String bucketName) {
        try {
            minioClient.makeBucket(MakeBucketArgs.builder()
                    .bucket(bucketName)
                    .build());
        } catch (Exception e) {
            LOGGER.error("Minio错误: 创建Bucket {} 失败", bucketName);
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 删除存储bucket
     *
     * @param bucketName 存储bucket名称
     * @return Boolean
     */
    public Boolean removeBucket(String bucketName) {
        try {
            minioClient.removeBucket(RemoveBucketArgs.builder()
                    .bucket(bucketName)
                    .build());
        } catch (Exception e) {
            LOGGER.error("Minio错误: 删除Bucket {} 失败", bucketName);
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 批量上传文件
     *
     * @param multipartFile 文件
     * @return 文件路径集合
     */
    public List<String> uploadBatchFile(MultipartFile[] multipartFile, String bucketName) {
        List<String> names = new ArrayList<>(multipartFile.length);
        for (MultipartFile file : multipartFile) {
            // 获取文件路径+名字
            String fileName = minioUp(file, bucketName);
            names.add(fileName);
        }
        return names;
    }

    /**
     * 上传单个文件
     *
     * @param file 文件
     * @return 文件路径
     */
    public String uploadFileString(MultipartFile file, String bucketName) {
        // 上传文件
        return minioUp(file, bucketName);
    }

    /**
     * 上传单个文件
     *
     * @param file 文件
     * @return 文件路径
     */
    @Transactional(rollbackFor = Exception.class)
    public FileVO uploadFile(MultipartFile file, String bucketName) {
        // 获取文件原名称
        String fileName = file.getOriginalFilename();
        // 上传文件
        String relativePath = minioUp(file, bucketName);
        // 保存记录
        FileVO fileVO = new FileVO(fileName, relativePath, minIoClientConfig.getEndpoint() + Constants.FILE_SEPARATOR + relativePath, minIoClientConfig.getEndpoint());
        FileRecord fileRecord = new FileRecord();
        fileRecord.setFileName(fileName);
        fileRecord.setFile(fileVO.getRelativePath());
        fileRecord.setFileType(FileUtil.getFileType(fileVO.getRelativePath()));
        fileRecord.setFileSize(String.valueOf(file.getSize()));
        save(fileRecord);
        fileVO.setId(fileRecord.getId());
        return fileVO;
    }

    /**
     * 获取文件预览路径
     *
     * @param fileName 文件名字
     * @return 文件预览路径
     */
    public String getPreviewUrl(String fileName, String bucketName) {
        if (StringUtil.isNotBlank(fileName)) {
            try {
                minioClient.statObject(StatObjectArgs.builder().bucket(bucketName).object(fileName).build());
                if (0 == minIoClientConfig.getPreviewExpiry()) {
                    return minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder().method(Method.GET).bucket(bucketName).object(fileName).build());
                } else {
                    return minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder().method(Method.GET).bucket(bucketName).object(fileName).expiry(minIoClientConfig.getPreviewExpiry(), TimeUnit.MINUTES).build());
                }
            } catch (Exception e) {
                LOGGER.error("Minio错误: 获取文件预览路径失败 {}", e.getMessage());
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }


    /**
     * 下载文件
     *
     * @param fileName 文件名字
     * @return org.springframework.http.ResponseEntity<byte [ ]>
     */
    public ResponseEntity<byte[]> download(String fileName, String bucketName) {
        ResponseEntity<byte[]> responseEntity = null;
        InputStream in = null;
        ByteArrayOutputStream out = null;
        try {
            in = minioClient.getObject(GetObjectArgs.builder().bucket(bucketName).object(fileName).build());
            out = new ByteArrayOutputStream();
            IOUtils.copy(in, out);
            // 封装返回值
            byte[] bytes = out.toByteArray();
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, StandardCharsets.UTF_8));
            headers.setContentLength(bytes.length);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setAccessControlExposeHeaders(List.of("*"));
            responseEntity = new ResponseEntity<>(bytes, headers, HttpStatus.OK);
        } catch (Exception e) {
            LOGGER.error("Minio错误: 下载文件失败 {}", e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return responseEntity;
    }

    /**
     * 批量删除文件对象
     *
     * @param objects 对象名称集合
     */
    public void removeObjects(List<String> objects, String bucketName) throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        List<DeleteObject> dos = objects.stream().map(DeleteObject::new).collect(Collectors.toList());
        Iterable<Result<DeleteError>> results = minioClient.removeObjects(RemoveObjectsArgs.builder().bucket(bucketName).objects(dos).build());
        for (Result<DeleteError> result : results) {
            DeleteError error = result.get();
            LOGGER.error("Minio错误: 删除文件 {} 失败 {}", error.objectName(), error.message());
        }
    }

    /**
     * 清空某个bucket
     *
     * @param bucketName bucketName
     */
    public void clearBucket(String bucketName) {
        try {
            // 获取所有文件
            List<String> bucketAllFiles = getBucketAllFiles(bucketName);
            removeObjects(bucketAllFiles, bucketName);
        } catch (Exception e) {
            LOGGER.error("Minio错误: 清空文件失败 {}", e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 获取bucket所有文件路径
     */
    public List<String> getBucketAllFiles(String bucketName) {
        List<String> filePathList = new ArrayList<>(12);

        try {
            boolean flag = minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
            if (flag) {
                // 递归列举某个bucket下的所有文件，然后循环删除
                Iterable<Result<Item>> iterable = minioClient.listObjects(ListObjectsArgs.builder()
                        .bucket(bucketName)
                        .recursive(true)
                        .build());
                for (Result<Item> itemResult : iterable) {
                    filePathList.add(itemResult.get().objectName());
                }
            }
        } catch (Exception e) {
            LOGGER.error("Minio错误: 获取bucket所有文件路径失败 {}", e.getMessage());
            e.printStackTrace();
        }
        return filePathList;
    }

    /**
     * minio上传
     *
     * @param file 文件
     * @return 文件名
     */
    private String minioUp(MultipartFile file, String bucketName) {
        String fileName = FileUtil.getTimePathFileName(file);
        InputStream in = null;
        try {
            in = file.getInputStream();
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(bucketName)
                    .object(fileName)
                    .stream(in, in.available(), -1)
                    .contentType(file.getContentType())
                    .build()
            );
        } catch (Exception e) {
            LOGGER.error("Minio错误: 上传文件 {} 失败", fileName);
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return bucketName + Constants.FILE_SEPARATOR + fileName;
    }

    /**
     * 文件查询
     */
    public List<FileRecordVO> fileQuery(FileQueryDTO dto) {
        List<FileRecordVO> result = new ArrayList<>();
        List<FileRecord> fileRecordList = lambdaQuery()
                .like(StringUtil.isNotBlank(dto.getFileName()), FileRecord::getFileName, dto.getFileName())
                .like(StringUtil.isNotBlank(dto.getFilePath()), FileRecord::getFile, dto.getFilePath())
                .like(StringUtil.isNotBlank(dto.getFileType()), FileRecord::getFileType, dto.getFileType())
                .in(CollectionUtils.isNotEmpty(dto.getIds()), FileRecord::getId, dto.getIds())
                .list();
        if (CollectionUtils.isNotEmpty(fileRecordList)) {
            result = fileRecordList.stream().map(record -> {
                FileRecordVO fileRecordVO = new FileRecordVO();
                BeanUtils.copyProperties(record, fileRecordVO);
                return fileRecordVO;
            }).collect(Collectors.toList());
        }
        return result;
    }
}