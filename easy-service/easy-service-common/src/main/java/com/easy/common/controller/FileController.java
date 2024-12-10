package com.easy.common.controller;


import com.easy.api.dto.FileQueryDTO;
import com.easy.api.vo.FileRecordVO;
import com.easy.api.vo.FileVO;
import com.easy.common.bean.dto.FileDTO;
import com.easy.common.service.FileRecordService;
import com.easy.common.service.FileService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    private final FileService fileService;
    private final FileRecordService fileRecordService;

    public FileController(FileService fileService, FileRecordService fileRecordService) {
        this.fileService = fileService;
        this.fileRecordService = fileRecordService;
    }


    /**
     * 获取文件HOST
     *
     * @return 文件服务HOST
     */
    @PostMapping(value = "/host")
    @Operation(summary = "获取文件HOST")
    public String getHost() {
        return null;
    }

    /**
     * 上传文件
     *
     * @param file 文件
     * @return 文件相对路径+名字
     */
    @PostMapping(value = "/upload")
    @Operation(summary = "上传文件")
    public FileVO upload(@RequestPart(name = "file") MultipartFile file) {
        return fileService.upload(file);
    }

    /**
     * 文件查询
     */
    @PostMapping(value = "/query")
    @Operation(summary = "文件查询")
    public List<FileRecordVO> fileQuery(@RequestBody FileQueryDTO vo) {
        return fileRecordService.fileQuery(vo);
    }

    /**
     * 删除文件
     *
     * @param dto 文件名字集合
     */
    @PostMapping(value = "/delete")
    @Operation(summary = "删除文件")
    public String delete(@RequestBody FileDTO dto) {
        fileService.deleteFile(dto.getFileName());
        return "";
    }

    /**
     * 获取预览文件地址
     *
     * @param dto 文件名字
     * @return 文件预览路径
     */
    @PostMapping(value = "/preview")
    @Operation(summary = "获取预览文件地址")
    public byte[] preview(@RequestBody FileDTO dto) throws IOException {
        return fileService.download(dto.getFileName());
    }
}