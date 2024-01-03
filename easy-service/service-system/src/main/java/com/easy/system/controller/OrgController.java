package com.easy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.framework.constant.Constants;
import com.easy.satoken.stp.StpAdminUtil;
import com.easy.system.bean.dto.org.OrgDTO;
import com.easy.system.bean.dto.org.OrgEditDTO;
import com.easy.system.bean.dto.org.OrgPageDTO;
import com.easy.system.bean.vo.org.OrgSimpleTreeVO;
import com.easy.system.bean.vo.org.OrgTreeVO;
import com.easy.system.bean.vo.org.OrgUserTreeVO;
import com.easy.system.bean.vo.org.OrgVO;
import com.easy.system.service.OrgService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * 组织管理
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/org")
@Tag(name = "组织管理")
public class OrgController {


    private final OrgService orgService;

    public OrgController(OrgService orgService) {
        this.orgService = orgService;
    }

    @PostMapping("/info")
    @Operation(summary = "查询组织")
    public OrgVO info(@RequestBody @Valid IdDTO dto) {
        return orgService.info(dto);
    }

    @PostMapping("/tree")
    @Operation(summary = "查询组织树-详情版")
    public List<OrgTreeVO> tree() {
        return orgService.tree();
    }

    @PostMapping("/simple_tree")
    @Operation(summary = "查询组织树-简单版")
    public List<OrgSimpleTreeVO> simpleTree() {
        return orgService.simpleTree();
    }

    @PostMapping("/page")
    @Operation(summary = "分页查询组织")
    @SaCheckPermission(type = StpAdminUtil.TYPE, value = "system.org.page", orRole = Constants.ADMIN_ROLE)
    public Page<OrgVO> page(@RequestBody OrgPageDTO dto) {
        return orgService.page(dto);
    }

    @PostMapping("/add")
    @Operation(summary = "新增组织信息")
    @SaCheckPermission(type = StpAdminUtil.TYPE, value = "system.org.add", orRole = Constants.ADMIN_ROLE)
    public void add(@Valid @RequestBody OrgDTO dto) {
        orgService.add(dto);
    }

    @PostMapping("/update")
    @Operation(summary = "更新组织信息")
    @SaCheckPermission(type = StpAdminUtil.TYPE, value = "system.org.update", orRole = Constants.ADMIN_ROLE)
    public void update(@Valid @RequestBody OrgEditDTO dto) {
        orgService.update(dto);
    }

    @PostMapping("/del")
    @Operation(summary = "删除组织信息")
    @SaCheckPermission(type = StpAdminUtil.TYPE, value = "system.org.del", orRole = Constants.ADMIN_ROLE)
    public void del(@RequestBody IdDTO dto) {
        orgService.del(dto);
    }

    @PostMapping("/org_user_tree")
    @Operation(summary = "查询机构和用户组成的树形数据")
    public List<OrgUserTreeVO> orgUserTree() {
        return orgService.orgUserTree();
    }

}