package com.easy.core.enums;

import com.easy.core.constant.HttpCodes;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum REnum implements EnumInterface<Integer> {

    /**
     * 响应码枚举
     */
    SUCCESS(HttpCodes.SUCCESS, "SUCCESS"),
    NO_DATA_SUCCESS(HttpCodes.SUCCESS, "NO_DATA_SUCCESS"),

    RUNTIME_EXCEPTION(HttpCodes.ERROR, "ERROR"),
    AUTHENTICATION_FAILURE(HttpCodes.ERROR, "AUTHENTICATION FAILED"),
    UNAUTHORIZED(HttpCodes.UNAUTHORIZED, "UNAUTHORIZED ACCESS"),
    NOT_LOGIN(HttpCodes.UNAUTHORIZED, "NOT LOGIN"),
    BAD_CREDENTIAL(HttpCodes.BAD_REQUEST, "CLIENT CREDENTIAL ERROR"),
    UNSUPPORTED_GRANT_TYPE(HttpCodes.BAD_REQUEST, "UNSUPPORTED AUTHORIZATION TYPE"),

    FORBIDDEN(HttpCodes.FORBIDDEN, "FORBIDDEN"),
    UNKNOWN_EXCEPTION(HttpCodes.ERROR, "UNKNOWN EXCEPTION"),

    NOT_FUND_EXCEPTION(HttpCodes.ERROR, "NO SIGNATURE OBTAINED"),
    TOKEN_EXCEPTION(HttpCodes.UNAUTHORIZED, "SIGNATURE ANOMALY"),
    TOKEN_WRONGFUL(HttpCodes.BAD_REQUEST, "SIGNATURE IS ILLEGAL"),
    TOKEN_EXPIRED(HttpCodes.FORBIDDEN, "SIGNATURE EXPIRED ACCESS PROHIBITED"),
    DUPLICATE_SUBMIT(HttpCodes.DUPLICATE_SUBMIT, "PLEASE DO NOT RESUBMIT"),

    ;

    private final Integer code;
    private final String introduction;
}