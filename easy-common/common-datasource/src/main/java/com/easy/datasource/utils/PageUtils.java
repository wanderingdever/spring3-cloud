package com.easy.datasource.utils;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.bean.dto.PageDTO;
import com.easy.utils.BeanUtils;
import com.easy.utils.lang.ListUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 分页工具
 * </p>
 *
 * @author Matt
 */
public class PageUtils {

    /**
     * 禁止实例化
     */
    private PageUtils() {
        throw new IllegalAccessError(this.getClass().getName());
    }

    /**
     * 手动分页
     *
     * @param list    待分页集合
     * @param current 当前页数
     * @param size    每页大小
     * @param <T>     类型
     * @return 分页结果
     */
    public static <T> List<T> page(List<T> list, long current, long size) {

        return page(list, (int) current, (int) size);
    }

    /**
     * 手动分页
     *
     * @param list    待分页集合
     * @param current 当前页数
     * @param size    每页大小
     * @param <T>     类型
     * @return 分页结果
     */
    public static <T> List<T> page(List<T> list, int current, int size) {

        if (current < 0 || size < 0) {
            return new ArrayList<>();
        }
        List<List<T>> lists = ListUtils.splitList(list, size);
        if (lists.size() < current) {
            return new ArrayList<>();
        }
        return lists.get(current - 1);
    }

    public static <T> Page<T> getPage(IPage<?> pageInterface, List<T> list) {

        Page<T> page = new Page<>();
        com.easy.utils.BeanUtils.populate(pageInterface, page);
        page.setRecords(list);
        return page;
    }

    public static <T> Page<T> getPage(IPage<?> pageInterface, Class<T> clazz) {

        Page<T> page = new Page<>();
        com.easy.utils.BeanUtils.populate(pageInterface, page);
        List<T> list = new ArrayList<>();
        com.easy.utils.BeanUtils.populateList(pageInterface.getRecords(), list, clazz);
        page.setRecords(list);
        return page;
    }

    public static <T, R> Page<R> getPage(IPage<T> pageInterface, Function<? super T, ? extends R> mapper) {

        Page<R> page = new Page<>();
        BeanUtils.populate(pageInterface, page);
        List<R> collect = pageInterface.getRecords().stream().map(mapper).collect(Collectors.toList());
        page.setRecords(collect);
        return page;
    }

    public static <T> Page<T> getPageCondition(PageDTO dto) {

        Page<T> page = new Page<>();
        page.setSize(dto.getSize());
        page.setCurrent(dto.getCurrent());
        if (dto.getOrders() != null && !dto.getOrders().isEmpty()) {
            page.addOrder(dto.getOrders());
        }
        return page;
    }

    public static <T> Page<T> getPageCondition(Long size, Long current) {

        return new Page<T>().setCurrent(current).setSize(size);
    }

    public static <T> Page<T> getPage(PageDTO dto) {

        Page<T> page = new Page<>();
        page.setSize(dto.getSize());
        page.setCurrent(dto.getCurrent());
        if (dto.getOrders() != null && !dto.getOrders().isEmpty()) {
            page.addOrder(dto.getOrders());
        }
        return page;
    }

    /**
     * 对列表进行分页处理。
     *
     * @param list 原始列表
     * @param dto  分页信息
     * @return 分页后的列表及分页信息
     */
    public static <T> Page<T> paginate(List<T> list, PageDTO dto) {
        Page<T> page = getPage(dto);
        if (list == null || list.isEmpty()) {
            return page;
        }

        // 计算起始索引
        int startIndex = (int) ((dto.getCurrent() - 1) * dto.getSize());
        int endIndex = (int) Math.min(startIndex + dto.getSize(), list.size());

        // 截取列表
        List<T> subList = list.subList(startIndex, endIndex);

        // 计算总页数
        int totalPages = (int) Math.ceil((double) list.size() / dto.getSize());
        page.setPages(totalPages);
        page.setRecords(subList);
        return page;
    }
}