package com.easy.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.datasource.bean.dto.IdListDTO;
import com.easy.system.bean.dto.org.OrgDTO;
import com.easy.system.bean.dto.org.OrgEditDTO;
import com.easy.system.bean.dto.org.OrgPageDTO;
import com.easy.system.bean.vo.org.OrgSimpleTreeVO;
import com.easy.system.bean.vo.org.OrgTreeVO;
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
    @Operation(description = "查询组织")
    public OrgVO info(@RequestBody @Valid IdDTO dto) {
        return orgService.info(dto);
    }

    @PostMapping("/tree")
    @Operation(description = "查询组织树-详情版")
    public List<OrgTreeVO> tree() {
        return orgService.tree();
    }

    @PostMapping("/simple_tree")
    @Operation(description = "查询组织树-简单版")
    public List<OrgSimpleTreeVO> simpleTree() {
        return orgService.simpleTree();
    }

    @PostMapping("/page")
    @Operation(description = "分页查询组织")
    public Page<OrgVO> page(@RequestBody OrgPageDTO dto) {
        return orgService.page(dto);
    }

    @PostMapping("/add")
    @Operation(description = "新增组织信息")
    public void add(@Valid @RequestBody OrgDTO dto) {
        orgService.add(dto);
    }

    @PostMapping("/update")
    @Operation(description = "更新组织信息")
    public void update(@Valid @RequestBody OrgEditDTO dto) {
        orgService.update(dto);
    }

    @PostMapping("/del")
    @Operation(description = "删除组织信息")
    public void del(@RequestBody IdListDTO dto) {
        orgService.del(dto);
    }
}