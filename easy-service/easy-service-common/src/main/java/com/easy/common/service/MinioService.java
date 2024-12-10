package com.easy.common.service;

import com.easy.api.vo.FileVO;
import com.easy.common.config.MinIoClientConfig;
import com.easy.core.constant.Constants;
import com.easy.core.exception.CustomizeException;
import com.easy.utils.file.FileUtils;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.RemoveObjectsArgs;
import io.minio.Result;
import io.minio.messages.DeleteError;
import io.minio.messages.DeleteObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.stream.Collectors;

/**
 * minio文件
 * </p>
 *
 * @author Matt
 */
@Service
@ConditionalOnProperty(name = "file.storage", havingValue = "minio")
public class MinioService implements FileService {
    private static final Logger LOGGER = LoggerFactory.getLogger(MinioService.class);

    private final MinioClient minioClient;
    private final MinIoClientConfig minIoClientConfig;
    private final FileRecordService fileRecordService;

    public MinioService(MinioClient minioClient, MinIoClientConfig minIoClientConfig, FileRecordService fileRecordService) {
        this.minioClient = minioClient;
        this.minIoClientConfig = minIoClientConfig;
        this.fileRecordService = fileRecordService;
    }


    @Override
    public FileVO upload(MultipartFile file) {
        // 获取文件原名称
        String fileName = file.getOriginalFilename();
        // 上传文件
        String relativePath = minioUp(file);
        String absolutePath = minIoClientConfig.getEndpoint() + Constants.FILE_SEPARATOR + relativePath;
        // 保存记录
        return fileRecordService.saveRecord(fileName, relativePath, minIoClientConfig.getEndpoint(), file.getSize());
    }

    @Override
    public byte[] download(String fileName) {

        return null;
    }

    @Override
    public String deleteFile(String fileName) {
        return "";
    }

    @Override
    public String batchDeleteFiles(List<String> fileNames) {
        List<DeleteObject> dos = fileNames.stream().map(DeleteObject::new).collect(Collectors.toList());
        Iterable<Result<DeleteError>> results = minioClient.removeObjects(RemoveObjectsArgs.builder().bucket(minIoClientConfig.getBucketName()).objects(dos).build());
        for (Result<DeleteError> result : results) {
            DeleteError error = null;
            try {
                error = result.get();
            } catch (Exception e) {
                throw new CustomizeException("Minio Delete Error");
            }
            LOGGER.error("Minio错误: 删除文件 {} 失败 {}", error.objectName(), error.message());
        }
        return null;
    }

    @Override
    public List<FileVO> uploadBatch(MultipartFile[] files) {
        return null;
    }


    /**
     * minio上传
     *
     * @param file 文件
     * @return 文件名
     */
    private String minioUp(MultipartFile file) {
        String fileName = FileUtils.getTimePathFileName(file);
        String bucketName = minIoClientConfig.getBucketName();
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
            LOGGER.error("Minio错误: 上传文件 {} 失败：{}", fileName, e.getMessage());
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    LOGGER.error("Minio错误: 关闭链接失败 {} ", e.getMessage());
                }
            }
        }
        return bucketName + Constants.FILE_SEPARATOR + fileName;
    }
}