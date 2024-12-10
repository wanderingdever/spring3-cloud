package com.easy.common.service;

import com.easy.api.vo.FileVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 文件接口
 * </p>
 *
 * @author Matt
 */
public interface FileService {

    /**
     * 上传单个文件
     *
     * @param file 文件
     * @return FileVO 上传信息
     */
    FileVO upload(MultipartFile file);

    /**
     * 批量上传文件
     *
     * @param files 文件集合
     * @return List<FileVO> 上传信息
     */
    List<FileVO> uploadBatch(MultipartFile[] files);

    /**
     * 获取文件预览地址
     *
     * @param fileName 文件名
     * @return 字节流
     */
    byte[] download(String fileName) throws IOException;

    /**
     * 删除文件
     *
     * @param fileName 文件名
     * @return 操作结果
     */
    String deleteFile(String fileName);

    /**
     * 删除文件
     *
     * @param fileNames 文件名
     * @return 操作结果
     */
    String batchDeleteFiles(List<String> fileNames);
}