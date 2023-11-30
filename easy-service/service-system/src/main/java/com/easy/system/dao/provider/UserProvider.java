package com.easy.system.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.system.bean.dto.user.UserSearchDTO;
import com.easy.system.bean.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

/**
 * 用户provider
 * </p>
 *
 * @author Matt
 */
public class UserProvider extends BaseProvider<User> {

    private static final UserProvider PROVIDER = new UserProvider();

    public static UserProvider get() {
        return PROVIDER;
    }

    public String page(@Param("dto") UserSearchDTO dto) {
        UserInfoProvider userInfoProvider = UserInfoProvider.get();
        UserOrgProvider userOrgProvider = UserOrgProvider.get();
        SQL sql = new SQL();
        Set<String> excludeFieldSet = new HashSet<>();
        excludeFieldSet.add("update_time");
        select(sql, excludeFieldSet);
        from(sql);
        excludeFieldSet.addAll(UserProvider.get().getColumnList());
        join(sql, userInfoProvider, excludeFieldSet, "id", "user_id");
        join(sql, userOrgProvider, excludeFieldSet, "id", "user_id");
        sql.SELECT(UserInfoProvider.get().getTablePrefix() + ".`id` AS `userInfoId`");
        sql.SELECT("GREATEST(" + UserInfoProvider.get().getTablePrefix() + ".`update_time`, " + getTablePrefix() + ".`update_time`) AS updateTime");
        userOrgProvider.where(sql, "org_id = #{dto.orgId}");
        // 性别
        if (Objects.nonNull(dto.getGender())) {
            userInfoProvider.where(sql, "gender = #{dto.userKey}");
        }
        // 账号
        if (StringUtils.isNotBlank(dto.getUsername())) {
            where(sql, "username LIKE CONCAT('%', #{dto.username}, '%')");
        }
        // 手机号
        if (StringUtils.isNotBlank(dto.getPhone())) {
            where(sql, "phone LIKE CONCAT('%', #{dto.phone}, '%')");
        }
        // 邮箱
        if (StringUtils.isNotBlank(dto.getEmail())) {
            where(sql, "email LIKE CONCAT('%', #{dto.email}, '%')");
        }
        // 性别
        if (Objects.nonNull(dto.getAccountStatus())) {
            userInfoProvider.where(sql, "status = #{dto.accountStatus}");
        }
        // 排序
        sort(dto.getOrders(), List.of(get(), userInfoProvider), sql);
        page(dto.getCurrent(), dto.getSize(), sql);
        return sql.toString();
    }
}