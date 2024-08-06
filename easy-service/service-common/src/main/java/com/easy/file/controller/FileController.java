package com.easy.file.controller;


import com.easy.api.dto.FileQueryDTO;
import com.easy.api.vo.FileRecordVO;
import com.easy.api.vo.FileVO;
import com.easy.file.bean.dto.FileDTO;
import com.easy.file.service.MinioFileService;
import io.minio.errors.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * 文件服务
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/file")
@Tag(name = "文件服务")
public class FileController {

    private final MinioFileService minioFileService;

    public FileController(MinioFileService minioFileService) {
        this.minioFileService = minioFileService;
    }


    /**
     * 获取文件HOST
     *
     * @return 文件服务HOST
     */
    @PostMapping(value = "/host")
    @Operation(description = "获取文件HOST")
    public String getHost() {
        return minioFileService.getMinIoClientConfig().getEndpoint();
    }


    /**
     * 上传文件
     *
     * @param file 文件
     * @return 文件相对路径+名字
     */
    @PostMapping(value = "/upload")
    @Operation(description = "上传文件")
    public FileVO upload(@RequestPart(name = "file") MultipartFile file) {
        return minioFileService.uploadFile(file, minioFileService.getMinIoClientConfig().getBucketName());
    }

    /**
     * 文件查询
     */
    @PostMapping(value = "/query")
    @Operation(description = "文件查询")
    public List<FileRecordVO> fileQuery(@RequestBody FileQueryDTO vo) {
        return minioFileService.fileQuery(vo);
    }

    /**
     * 删除文件
     *
     * @param dto 文件名字集合
     */
    @PostMapping(value = "/delete")
    @Operation(description = "删除文件")
    public String delete(@RequestBody FileDTO dto) throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        minioFileService.removeObjects(dto.getFileNameList(), minioFileService.getMinIoClientConfig().getBucketName());
        return "";
    }

    /**
     * 下载文件
     *
     * @param dto 文件名字
     * @return 文件流
     */
    @PostMapping(value = "/download")
    @Operation(description = "下载文件")
    public ResponseEntity<byte[]> download(@RequestBody FileDTO dto) {
        return minioFileService.download(dto.getFileName(), minioFileService.getMinIoClientConfig().getBucketName());
    }

    /**
     * 获取预览文件地址
     *
     * @param dto 文件名字
     * @return 文件预览路径
     */
    @PostMapping(value = "/preview")
    @Operation(description = "获取预览文件地址")
    public String preview(@RequestBody FileDTO dto) {
        return minioFileService.getPreviewUrl(dto.getFileName(), minioFileService.getMinIoClientConfig().getBucketName());
    }
}