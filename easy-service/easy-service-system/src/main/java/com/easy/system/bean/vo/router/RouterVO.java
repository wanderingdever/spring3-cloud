package com.easy.system.bean.vo.router;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 路由
 *
 * @author Matt
 */
@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class RouterVO implements Serializable {

    /**
     * 路由名字
     */
    private String name;

    /**
     * 路由地址
     */
    private String path;

    /**
     * 重定向地址，当设置 noRedirect 的时候该路由在面包屑导航中不可被点击
     */
    private String redirect;

    /**
     * 组件地址
     */
    private String component;

    /**
     * 其他元素
     */
    private MetaVo meta;

    /**
     * 子路由
     */
    private List<RouterVO> children;
}