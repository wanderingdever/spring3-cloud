package com.hk.framework.bean.base;

import com.hk.framework.enums.REnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.ObjectError;

@Data
@Slf4j
@AllArgsConstructor
public class R<T> {

    @Schema(name = "返回编码", example = "0")
    public int code;

    @Schema(name = "返回消息", example = "操作成功")
    private String msg;

    @Schema(name = "响应参数 data")
    private T data;

    public R(REnum rEnum) {
        this.msg = rEnum.getIntroduction();
        this.code = rEnum.getCode();
    }

    private R() {
    }

    public static <T> R<T> success(T t) {

        R<T> respVo = new R<>(REnum.SUCCESS);
        respVo.setData(t);
        return respVo;
    }

    public static <T> R<T> success() {

        return success(null);
    }

    public static <T> R<T> fail(String msg) {

        R<T> respVo = new R<>(REnum.CUSTOM);
        respVo.setMsg(msg);
        return respVo;
    }

    public static <T> R<T> fail(REnum rEnum, Exception e) {

        R<T> respVo = new R<>(rEnum);
        if (null != e) {
            log.error("调用异常", e);
            respVo.setMsg(e.getMessage());
        }
        return respVo;
    }

    public static <T> R<T> fail(REnum rEnum) {

        return fail(rEnum, null);
    }

    public static <T> R<T> fail(ObjectError objectError) {

        R<T> respVo = new R<>(REnum.PARAM_ERROR);
        respVo.setMsg(objectError.getDefaultMessage());
        return respVo;
    }
}