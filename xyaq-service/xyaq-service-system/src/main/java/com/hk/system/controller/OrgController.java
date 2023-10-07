package com.hk.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.datasource.bean.dto.IdListDTO;
import com.hk.system.bean.dto.org.OrgDTO;
import com.hk.system.bean.dto.org.OrgEditDTO;
import com.hk.system.bean.dto.org.OrgPageDTO;
import com.hk.system.bean.vo.org.OrgTreeVO;
import com.hk.system.bean.vo.org.OrgVO;
import com.hk.system.service.OrgService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/org")
@Tag(name = "组织管理")
public class OrgController {

    @Resource
    private OrgService orgService;

    @PostMapping("/add")
    @Operation(summary = "新增组织信息")
    public void add(@Valid @RequestBody OrgDTO dto) {
        orgService.add(dto);
    }

    @PostMapping("/del")
    @Operation(summary = "删除组织信息")
    public void del(@RequestBody IdListDTO dto) {
        orgService.del(dto);
    }

    @PostMapping("/info")
    @Operation(summary = "查询组织", description = "使用 Id 查询详情")
    public OrgVO info(@RequestBody @Valid IdDTO dto) {
        return orgService.info(dto);
    }

    @PostMapping("/page")
    @Operation(summary = "分页查询组织")
    public Page<OrgVO> page(@RequestBody OrgPageDTO dto) {
        return orgService.page(dto);
    }

    @PostMapping("/tree")
    @Operation(summary = "查询组织树")
    public List<OrgTreeVO> tree() {
        return orgService.tree();
    }

    @PostMapping("/update")
    @Operation(summary = "更新组织信息")
    public void update(@Valid @RequestBody OrgEditDTO dto) {
        orgService.update(dto);
    }
}