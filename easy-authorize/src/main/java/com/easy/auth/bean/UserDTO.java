package com.easy.auth.bean;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 用户入参
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "用户入参")
public class UserDTO {

    private String username;
}