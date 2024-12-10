package com.easy.utils.file;

import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

@Slf4j
public class Base64FileUtil {

    private static final Pattern FILE_SUFFIX_PATTERN = Pattern.compile("(?<=/)(?<fileSuffix>\\w.*?)(?=;)");

    public static String fixBase64Image(String base64Image) {

        return fixBase64("data:image/jpeg;base64,", base64Image);
    }

    public static String fixBase64(String prefix, String base64Image) {

        if (StringUtils.isBlank(prefix)) {
            throw new RuntimeException("base64 前缀数据为空");
        }
        if (StringUtils.isBlank(base64Image)) {
            throw new RuntimeException("base64 数据为空");
        }
        if (!base64Image.startsWith("data:")) {
            base64Image = prefix + base64Image;
        }
        return base64Image;
    }

    public static String getRandomFileName(String fileSuffix) {

        if (StringUtils.isBlank(fileSuffix)) {
            throw new RuntimeException("文件后缀为空");
        }
        return UUID.randomUUID().toString().replace("-", "") + "." + fileSuffix;
    }

    public static byte[] decodeBase64Image(String base64Image) {

        String[] parts = base64Image.split(",");
        String imageString = parts[1];
        return Base64.getDecoder().decode(imageString);
    }

    /**
     * 获取base64图片的文件后缀
     *
     * @param base64Image base64
     * @return String jpeg
     */
    public static String getFileSuffix(String base64Image) {

        if (StringUtils.isBlank(base64Image)) {
            throw new RuntimeException("base64 图片数据为空");
        }
        Matcher fileSuffixMatcher = FILE_SUFFIX_PATTERN.matcher(base64Image);
        if (!fileSuffixMatcher.find()) {
            return ".jpeg";
        }
        return "." + fileSuffixMatcher.group("fileSuffix");
    }

    @SneakyThrows
    public static File base64ToFile(String base64Image) {

        base64Image = fixBase64Image(base64Image);
        File tempFile = File.createTempFile(String.valueOf(UUID.randomUUID()), getFileSuffix(base64Image));
        byte[] bytes = decodeBase64Image(base64Image);
        ByteArrayInputStream inputStream = new ByteArrayInputStream(bytes);
        inputStreamToFile(inputStream, tempFile);
        return tempFile;
    }

    public static String byteToBase64(byte[] bytes) {

        return Base64.getEncoder().encodeToString(bytes);
    }

    private static void inputStreamToFile(InputStream ins, File file) throws IOException {

        OutputStream os = new FileOutputStream(file);
        int bytesRead;
        byte[] buffer = new byte[1024];
        while ((bytesRead = ins.read(buffer)) != -1) {
            os.write(buffer, 0, bytesRead);
        }
        os.close();
        ins.close();
    }

    /**
     * 将Base64编码的ZIP文件转换为文件流集合及其对应的文件名。
     *
     * @param base64String Base64编码的字符串
     * @return 文件流及其对应的文件名的列表
     */
    public static Map<String, InputStream> base64ToZipInputStreamsWithNames(String base64String) throws IOException {
        // 解码Base64字符串
        byte[] zipBytes = Base64.getDecoder().decode(base64String);
        // 将字节数据转换为InputStream
        ByteArrayInputStream zipInputStream = new ByteArrayInputStream(zipBytes);
        // 创建一个HashMap来存储文件名和文件流
        Map<String, InputStream> fileMap = new HashMap<>();
        // 创建一个ZipInputStream来读取ZIP文件
        ZipInputStream zis = new ZipInputStream(zipInputStream);
        try {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                // 忽略目录
                if (!entry.isDirectory()) {
                    // 将文件名和文件流存储到Map中
                    fileMap.put(entry.getName(), new ByteArrayInputStream(zis.readAllBytes()));
                }

            }
        } catch (IOException e) {
            throw new RuntimeException("获取文件失败");
        } finally {
            zis.closeEntry();
            // 关闭ZIP输入流
            zis.close();
        }
        return fileMap;
    }

    public static void main(String[] args) {
        try {
            String file = new String(Files.readAllBytes(Paths.get("C:\\Users\\jiaku\\Downloads\\test.txt")));

            // 创建一个HashMap来存储文件名和文件流
            Map<String, InputStream> fileMap = base64ToZipInputStreamsWithNames(file);
            // 遍历Map，将文件写入本地
            for (Map.Entry<String, InputStream> entryMap : fileMap.entrySet()) {
                String fileName = entryMap.getKey();
                InputStream fileStream = entryMap.getValue();
                try (FileOutputStream fos = new FileOutputStream(fileName)) {
                    byte[] buffer = new byte[1024];
                    int len;
                    while ((len = fileStream.read(buffer)) > 0) {
                        fos.write(buffer, 0, len);
                    }
                    System.out.println("文件 " + fileName + " 写入成功");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}