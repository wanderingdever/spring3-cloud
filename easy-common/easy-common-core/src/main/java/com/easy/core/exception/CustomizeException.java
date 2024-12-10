package com.easy.core.exception;

import com.easy.core.bean.base.R;
import com.easy.core.enums.REnum;

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