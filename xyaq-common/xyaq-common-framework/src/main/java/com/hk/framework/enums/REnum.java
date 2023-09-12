package com.hk.framework.enums;

import com.hk.utils.enums.EnumInterface;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum REnum implements EnumInterface<Integer> {

    /**
     * ?
     */
    SUCCESS(200, "操作成功"),
    NO_DATA_SUCCESS(200, "暂无数据"),

    RUNTIME_EXCEPTION(500, "异常"),
    CUSTOM(20001, "自定义错误"),
    NOT_LOGIN(20002, "未登录"),
    DATA_EXISTED(20003, "数据已经存在"),
    PARAM_ERROR(20004, "请求数据格式不符合要求"),
    DB_EXCEPTION(20005, "数据库异常"),
    NO_DATA(20006, "没有查询到数据"),
    NO_AUTHORITY(20008, "没有操作权限"),
    WRONG_PASSWORD(20009, "密码错误"),
    WRONG_TOKEN(20010, "不合法 token"),
    ;

    private final Integer code;
    private final String introduction;
}