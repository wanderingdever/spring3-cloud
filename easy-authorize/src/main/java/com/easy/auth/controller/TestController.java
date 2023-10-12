package com.easy.auth.controller;

import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/")
public class TestController {

    @GetMapping("/one")
    public String test() {
        return "test";
    }

    // 测试登录  ---- http://localhost:8081/acc/doLogin?name=zhang&pwd=123456
    @RequestMapping("doLogin")
    public SaResult doLogin(String name, String pwd) {
        // 此处仅作模拟示例，真实项目需要从数据库中查询数据进行比对
        if ("zhang".equals(name) && "123456".equals(pwd)) {
            StpUtil.login(10001, SaLoginModel.create().setDevice("pc").setExtra("1111", "111"));
            StpUtil.getSession().set("111", "11");
            StpUtil.getSession().get("111");
            SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
            StpUtil.getPermissionList();
            // 第3步，返回给前端
            return SaResult.data(tokenInfo);
        }
        return SaResult.error("登录失败");
    }


}