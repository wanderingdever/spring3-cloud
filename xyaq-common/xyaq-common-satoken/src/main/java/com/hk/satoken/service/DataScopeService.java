package com.hk.satoken.service;

import com.hk.api.service.RemoteUserService;
import com.hk.redis.utils.TempCacheUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dataScopeService")
public class DataScopeService {

    @DubboReference
    private RemoteUserService remoteUserService;

    public List<String> authorizedOrgIdListOneSelf() {
        List<String> orgIdList = TempCacheUtil.getShortTimeCache(() -> remoteUserService.authorizedOrgIdListOneSelf());
        if (CollectionUtils.isEmpty(orgIdList)) {
            return List.of("-1");
        }
        return orgIdList;
    }

    public List<String> authorizedOrgIdList() {

        List<String> orgIdList = TempCacheUtil.getShortTimeCache(() -> remoteUserService.authorizedOrgIdList());
        if (CollectionUtils.isEmpty(orgIdList)) {
            return List.of("-1");
        }
        return orgIdList;
    }
}