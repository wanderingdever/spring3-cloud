package com.hk.datasource.service;

import com.hk.api.service.RemoteUserService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dataScopeService")
public class DataScopeService {

    @DubboReference
    private RemoteUserService remoteUserService;

    public List<String> authorizedOrgIdList() {

        List<String> orgIdList = remoteUserService.authorizedOrgIdList(false);
        if (CollectionUtils.isEmpty(orgIdList)) {
            return List.of("-1");
        }
        return orgIdList;
    }

    public List<String> authorizedOrgIdListAndChild() {

        List<String> orgIdList = remoteUserService.authorizedOrgIdList(true);
        if (CollectionUtils.isEmpty(orgIdList)) {
            return List.of("-1");
        }
        return orgIdList;
    }
}