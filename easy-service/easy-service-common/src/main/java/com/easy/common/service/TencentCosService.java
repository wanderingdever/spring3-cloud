package com.easy.common.service;

import com.easy.api.vo.FileVO;
import com.easy.common.config.TencentCosConfig;
import com.easy.core.exception.CustomizeException;
import com.easy.utils.file.FileUtils;
import com.easy.utils.lang.StringUtils;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.http.HttpProtocol;
import com.qcloud.cos.model.*;
import com.qcloud.cos.region.Region;
import com.qcloud.cos.transfer.TransferManager;
import com.qcloud.cos.utils.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


/**
 * 腾讯云cos
 * </p>
 *
 * @author Matt
 */
@Service
@ConditionalOnProperty(name = "file.storage", havingValue = "tencent")
public class TencentCosService implements FileService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TencentCosService.class);

    private final COSClient cosClient;

    private final TencentCosConfig cosConfig;

    private final FileRecordService fileRecordService;

    public TencentCosService(COSClient cosClient, TencentCosConfig cosConfig, FileRecordService fileRecordService) {
        this.cosClient = cosClient;
        this.cosConfig = cosConfig;
        this.fileRecordService = fileRecordService;
    }


    @Override
    public FileVO upload(MultipartFile file) {
        int imageSize = 20;
        int maxSize = imageSize << 20;
        if (file.getSize() > maxSize) {
            throw new CustomizeException("上传文件大小不能超过" + imageSize + "M！");
        }
        String originalFilename = file.getOriginalFilename();

        String folderFileName = FileUtils.getTimePathFileName(file);
        String contentType = FileUtils.getContentType(originalFilename);
        // 生成对象键
        try {
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentLength(file.getSize());
            metadata.setContentType(contentType);
            PutObjectResult pubResult = cosClient.putObject(cosConfig.getBucketName(), folderFileName, file.getInputStream(), metadata);
            if (pubResult == null || StringUtils.isBlank(pubResult.getETag())) {
                LOGGER.error("上传到cos错误，put对象结果为null或etag为空,文件名: {}", folderFileName);
                throw new CustomizeException("文件上传失败");
            }
            // 保存记录
            return fileRecordService.saveRecord(originalFilename, folderFileName, cosConfig.getUrl(), file.getSize());
        } catch (Exception e) {
            throw new CustomizeException("文件上传失败");
        }
    }

    @Override
    public List<FileVO> uploadBatch(MultipartFile[] files) {
        return null;
    }

    @Override
    public byte[] download(String fileName) throws IOException {
        GetObjectRequest getObjectRequest = new GetObjectRequest(cosConfig.getBucketName(), fileName);
        COSObjectInputStream cosObjectInput = null;
        try {
            COSObject cosObject = cosClient.getObject(getObjectRequest);
            cosObjectInput = cosObject.getObjectContent();
            assert cosObjectInput != null;
            return IOUtils.toByteArray(cosObjectInput);
        } catch (Exception e) {
            LOGGER.error("下载文件失败:{}", e.getMessage());
        } finally {
            // 用完流之后一定要调用 close()
            cosObjectInput.close();
        }
        // 在流没有处理完之前，不能关闭 cosClient  确认本进程不再使用 cosClient 实例之后，关闭即可
        cosClient.shutdown();
        return null;
    }

    @Override
    public String deleteFile(String fileName) {
        // 指定要删除的 bucket 和对象键
        cosClient.deleteObject(cosConfig.getBucketName(), fileName);
        return null;
    }

    @Override
    public String batchDeleteFiles(List<String> fileNames) {
        return "";
    }


    /**
     * 创建 TransferManager 实例，这个实例用来后续调用高级接口
     *
     * @return TransferManager
     */
    TransferManager createTransferManager() {
        // 创建一个 COSClient 实例，这是访问 COS 服务的基础实例。
        // 详细代码参见本页: 简单操作 -> 创建 COSClient
        COSClient cosClient = createCOSClient();
        // 自定义线程池大小，建议在客户端与 COS 网络充足（例如使用腾讯云的 CVM，同地域上传 COS）的情况下，设置成16或32即可，可较充分的利用网络资源
        // 对于使用公网传输且网络带宽质量不高的情况，建议减小该值，避免因网速过慢，造成请求超时。
        ExecutorService threadPool = Executors.newFixedThreadPool(16);
        // 传入一个 threadpool, 若不传入线程池，默认 TransferManager 中会生成一个单线程的线程池。
        return new TransferManager(cosClient, threadPool);
    }

    // 创建 COSClient 实例，这个实例用来后续调用请求
    COSClient createCOSClient() {
        // SECRETID 和 SECRETKEY  https://console.cloud.tencent.com/cam/capi 进行查看和管理
        // 用户的 SecretId，建议使用子账号密钥，授权遵循最小权限指引，降低使用风险。
        String secretId = cosConfig.getSecretId();
        // 用户的 SecretKey，建议使用子账号密钥，授权遵循最小权限指引，降低使用风险。
        String secretKey = cosConfig.getSecretKey();
        COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
        // ClientConfig 中包含了后续请求 COS 的客户端设置：
        ClientConfig clientConfig = new ClientConfig();
        // 设置 bucket 的地域
        clientConfig.setRegion(new Region(cosConfig.getRegion()));
        // 设置请求协议, http 或者 https
        clientConfig.setHttpProtocol(HttpProtocol.https);
        // 以下的设置，是可选的：
        // 设置 socket 读取超时，默认 30s
        clientConfig.setSocketTimeout(30 * 1000);
        // 设置建立连接超时，默认 30s
        clientConfig.setConnectionTimeout(30 * 1000);
        // 生成 cos 客户端。
        return new COSClient(cred, clientConfig);
    }

    void shutdownTransferManager(TransferManager transferManager) {
        // 指定参数为 true, 则同时会关闭 transferManager 内部的 COSClient 实例。
        // 指定参数为 false, 则不会关闭 transferManager 内部的 COSClient 实例。
        transferManager.shutdownNow(true);
    }
}