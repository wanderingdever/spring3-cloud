package com.easy.system.bean.dto.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 组织新增-入参
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "组织新增-入参")
public class OrgDTO {

    @Schema(description = "上级id")
    private String orgParentId;

    @Schema(description = "组织名称")
    private String orgName;

    @Schema(description = "组织简称")
    private String orgShortName;

    @Schema(description = "组织级别")
    private String orgLevel;

    @Schema(description = "组织类型")
    private String orgType;

    @Schema(description = "组织性质")
    private String orgNature;

    @Schema(description = "机构编码")
    private String orgCode;

    @Schema(description = "组织标签")
    private String orgTag;

    @Schema(description = "省")
    private String orgProvince;

    @Schema(description = "市")
    private String orgCity;

    @Schema(description = "区")
    private String orgDistrict;

    @Schema(description = "区划代码集")
    private String orgAreaCode;

    @Schema(description = "详细地址")
    private String orgAddress;

    @Schema(description = "机构简介")
    private String orgDesc;

    @Schema(description = "logo")
    private String orgLogo;

    @Schema(description = "顺序")
    private Integer orgSort;

    @Schema(description = "组织状态")
    private String orgStatus;
}