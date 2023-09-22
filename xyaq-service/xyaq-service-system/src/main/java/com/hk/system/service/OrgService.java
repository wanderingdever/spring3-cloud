package com.hk.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.framework.exception.CustomizeException;
import com.hk.satoken.service.DataScopeService;
import com.hk.system.bean.pojo.Org;
import com.hk.system.dao.OrgMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class OrgService extends ServiceImpl<OrgMapper, Org> {

    @Resource
    private DataScopeService dataScopeService;

    public Org getOrg(String id) {
        return getOrg(List.of(id)).get(0);
    }

    public List<Org> getOrg(List<String> idList) {

        HashSet<String> idSet = new HashSet<>(idList);
        List<Org> list = lambdaQuery()
                .in(Org::getId, idSet)
                .in(Org::getId, dataScopeService.authorizedOrgIdList())
                .list();
        if (list.size() != idSet.size()) {
            throw new CustomizeException("组织不存在");
        }
        return list;
    }
}