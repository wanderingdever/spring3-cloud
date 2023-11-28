package com.easy.system.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.easy.satoken.service.DataScopeService;
import com.easy.system.bean.Area;
import com.easy.utils.json.JacksonUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

/**
 * 测试接口
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/test")
@Tag(name = "测试接口")
public class TestController {

    @PostMapping(value = "/saTokenTest")
    @Operation(description = "测试sa-token")
    public String test() {
        StpUtil.getRoleList();
        return StpUtil.getLoginId().toString();
    }

    @Resource
    private DataScopeService dataScopeService;

    public static void main(String[] args) {
        // 获取类加载器
        ClassLoader classLoader = TestController.class.getClassLoader();

        // 获取资源目录下的json文件
        InputStream inputStream = classLoader.getResourceAsStream("area.json");

        // 如果文件存在
        if (inputStream != null) {
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
                String line;
                StringBuilder jsonString = new StringBuilder();

                // 逐行读取文件内容
                while ((line = reader.readLine()) != null) {
                    jsonString.append(line);
                }
                List<Area> area = JacksonUtil.jsonToList(jsonString.toString(), Area.class);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("json文件不存在");
        }
    }

    @PostMapping("/authorized_org_id_list")
    @Operation(description = "查询用户授权的部门id列表")
    public List<String> authorizedOrgIdList() {
        return dataScopeService.authorizedOrgIdListOneSelf();
    }

    @PostMapping("/authorized_org_id_list_and_child")
    @Operation(description = "查询用户授权的部门id列表（包含）")
    public List<String> authorizedOrgIdListAndChild() {
        return dataScopeService.authorizedOrgIdList();
    }

    private List<Area> test(List<Area> areas) {
        areas.parallelStream().forEach(k -> {
            if (k.getCode().length() < 6) {
                int len = 6 - k.getCode().length();
                // k.setCode(k.getCode()+"0" * (6 - len(k.getCode())));
            }
        });
        return null;
    }
}