package com.hk.framework.exception;

import com.hk.framework.enums.REnum;
import com.hk.framework.vo.R;

/**
 * 自定义异常
 * </p>
 *
 * @author Matt
 */
public class CustomizeException extends RuntimeException {

    private final R<String> result;

    public CustomizeException(REnum rEnum) {
        super(rEnum.getIntroduction());
        this.result = R.fail(rEnum);
    }

    public CustomizeException(int code, String message) {
        super(message.toString());
        this.result = R.fail(code, message);
    }

    public CustomizeException(String message) {
        super(message.toString());
        this.result = R.fail(message);
    }

    public R<String> getResult() {
        return result;
    }
}