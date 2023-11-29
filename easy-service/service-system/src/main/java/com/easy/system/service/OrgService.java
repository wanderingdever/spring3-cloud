package com.easy.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.datasource.scope.DataScopeService;
import com.easy.datasource.utils.PageUtil;
import com.easy.framework.exception.CustomizeException;
import com.easy.system.bean.dto.org.OrgDTO;
import com.easy.system.bean.dto.org.OrgEditDTO;
import com.easy.system.bean.dto.org.OrgPageDTO;
import com.easy.system.bean.pojo.Org;
import com.easy.system.bean.pojo.UserOrg;
import com.easy.system.bean.vo.org.OrgSimpleTreeVO;
import com.easy.system.bean.vo.org.OrgTreeVO;
import com.easy.system.bean.vo.org.OrgVO;
import com.easy.system.dao.OrgMapper;
import com.easy.utils.lang.StringUtil;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class OrgService extends ServiceImpl<OrgMapper, Org> {

    @Resource
    private DataScopeService dataScopeService;

    @Resource
    private UserOrgService userOrgService;

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

    public Page<OrgVO> page(OrgPageDTO dto) {
        Page<Org> page = lambdaQuery()
                .eq(StringUtil.isNotBlank(dto.getOrgParentId()), Org::getOrgParentId, dto.getOrgParentId())
                .like(StringUtil.isNotBlank(dto.getOrgName()), Org::getOrgName, dto.getOrgName())
                .page(PageUtil.getPage(dto));
        return PageUtil.getPage(page, OrgVO.class);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void add(OrgDTO dto) {
        Org org = new Org();
        BeanUtils.copyProperties(dto, org);
        save(org);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void update(OrgEditDTO dto) {
        Org org = new Org();
        BeanUtils.copyProperties(dto, org);
        updateById(org);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdDTO dto) {
        Long child = lambdaQuery().in(Org::getOrgParentId, dto.getId()).count();
        if (child > 0) {
            throw new CustomizeException("所选组织存在下级组织,无法被删除");
        }
        Long user = userOrgService.lambdaQuery().in(UserOrg::getOrgId, dto.getId()).count();
        if (user > 0) {
            throw new CustomizeException("所选组织已与用户关联,无法被删除");
        }
        removeById(dto.getId());
    }

    public OrgVO info(IdDTO dto) {
        Org org = getOrg(dto.getId());
        return toOrgVO(org);
    }

    /**
     * 构建详细数据的机构树形
     *
     * @return {@link List<OrgTreeVO>}
     */
    public List<OrgTreeVO> tree() {
        LambdaQueryWrapper<Org> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        //        lambdaQueryWrapper.in(Org::getId, dataScopeService.authorizedOrgIdList());
        List<Org> list = list(lambdaQueryWrapper);
        return buildTree(list);
    }

    /**
     * 构建简单数据的机构树形
     *
     * @return {@link List<OrgSimpleTreeVO>}
     */
    public List<OrgSimpleTreeVO> simpleTree() {
        LambdaQueryWrapper<Org> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        //        lambdaQueryWrapper.in(Org::getId, dataScopeService.authorizedOrgIdList());
        List<Org> list = list(lambdaQueryWrapper);
        return buildSimpleTree(list);
    }

    private List<OrgTreeVO> buildTree(List<Org> list) {
        if (CollectionUtils.isEmpty(list)) {
            return new ArrayList<>();
        }
        // 分离数据
        List<OrgTreeVO> rootList = list.stream()
                .filter(k -> "0".equals(k.getOrgParentId()))
                .map(this::toOrgTreeVO)
                .toList();
        Map<String, List<OrgTreeVO>> leafMap = list.stream()
                .filter(k -> !"0".equals(k.getOrgParentId()))
                .map(this::toOrgTreeVO)
                .collect(Collectors.groupingBy(OrgTreeVO::getOrgParentId));
        // 组装数据
        buildBranch(rootList, leafMap);
        return rootList;
    }

    private List<OrgSimpleTreeVO> buildSimpleTree(List<Org> list) {
        if (CollectionUtils.isEmpty(list)) {
            return new ArrayList<>();
        }
        // 分离数据
        List<OrgSimpleTreeVO> rootList = list.stream()
                .filter(k -> "0".equals(k.getOrgParentId()))
                .map(this::toOrgSimpleTreeVO)
                .toList();
        Map<String, List<OrgSimpleTreeVO>> leafMap = list.stream()
                .filter(k -> !"0".equals(k.getOrgParentId()))
                .map(this::toOrgSimpleTreeVO)
                .collect(Collectors.groupingBy(OrgSimpleTreeVO::getOrgParentId));
        // 组装数据
        buildSimpleBranch(rootList, leafMap);
        return rootList;
    }

    private void buildBranch(List<OrgTreeVO> rootList, Map<String, List<OrgTreeVO>> leafMap) {
        if (CollectionUtils.isEmpty(rootList)) {
            return;
        }
        for (OrgTreeVO orgTreeVO : rootList) {
            List<OrgTreeVO> orgTreeList = leafMap.get(orgTreeVO.getId());
            leafMap.remove(orgTreeVO.getId());
            orgTreeVO.setChildren(orgTreeList);
            buildBranch(orgTreeList, leafMap);
        }
    }

    private void buildSimpleBranch(List<OrgSimpleTreeVO> rootList, Map<String, List<OrgSimpleTreeVO>> leafMap) {
        if (CollectionUtils.isEmpty(rootList)) {
            return;
        }
        for (OrgSimpleTreeVO orgTreeVO : rootList) {
            List<OrgSimpleTreeVO> orgTreeList = leafMap.get(orgTreeVO.getId());
            leafMap.remove(orgTreeVO.getId());
            orgTreeVO.setChildren(orgTreeList);
            buildSimpleBranch(orgTreeList, leafMap);
        }
    }


    private OrgTreeVO toOrgTreeVO(Org org) {
        OrgTreeVO vo = new OrgTreeVO();
        BeanUtil.copyProperties(org, vo);
        vo.setChildren(new ArrayList<>());
        return vo;
    }

    private OrgSimpleTreeVO toOrgSimpleTreeVO(Org org) {
        OrgSimpleTreeVO vo = new OrgSimpleTreeVO();
        BeanUtil.copyProperties(org, vo);
        vo.setChildren(new ArrayList<>());
        return vo;
    }

    private OrgVO toOrgVO(Org org) {
        OrgVO vo = new OrgVO();
        BeanUtil.copyProperties(org, vo);
        return vo;
    }

}