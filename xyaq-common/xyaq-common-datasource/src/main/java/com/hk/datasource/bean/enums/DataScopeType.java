package com.hk.datasource.bean.enums;

import com.hk.utils.enums.EnumInterface;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

/**
 * <p>数据权限类型</p>
 *
 * @author 小徐
 * @since 2023/9/21 14:49
 */
@Getter
@AllArgsConstructor
public enum DataScopeType implements EnumInterface<String> {

    /**
     * 全部数据权限
     */
    ALL("1", "", "全部"),

    /**
     * 部门权限
     */
    ORG_LIST_AND_CHILD("2", " org_id IN ( #{@dataScopeService.authorizedOrgIdListAndChild()} )", "部门及以下"),

    /**
     * 部门
     */
    ORG_LIST("3", " org_id IN ( #{@dataScopeService.authorizedOrgIdList()} )", "部门"),

    /**
     * 自定数据权限
     */
    CUSTOM("4", " org_id IN ( #{@sdss.getRoleCustom( #user.roleId )} ) ", "自定义"),
    ;

    private final String code;

    /**
     * 语法，采用 SpEL 模板表达式
     */
    private final String sqlTemplate;

    /**
     * 描述
     */
    private final String introduction;

    public static DataScopeType findCode(String code) {
        if (StringUtils.isBlank(code)) {
            return null;
        }
        for (DataScopeType type : values()) {
            if (type.getCode().equals(code)) {
                return type;
            }
        }
        return null;
    }
}