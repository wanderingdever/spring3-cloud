package com.hk.datasource.handler;

import cn.hutool.core.annotation.AnnotationUtil;
import cn.hutool.core.collection.ConcurrentHashSet;
import cn.hutool.core.util.ClassUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.hk.datasource.annotation.PermissionFilter;
import com.hk.datasource.bean.enums.DataScopeType;
import com.hk.framework.exception.CustomizeException;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Parenthesis;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.expression.BeanFactoryResolver;
import org.springframework.expression.BeanResolver;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.ParserContext;
import org.springframework.expression.common.TemplateParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

import java.lang.reflect.Method;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 数据权限过滤
 *
 * @author Lion Li
 * @version 3.5.0
 */
@Slf4j
public class PlusDataPermissionHandler {

    /**
     * 方法或类(名称) 与 注解的映射关系缓存
     */
    private final Map<String, PermissionFilter> permissionFilterCacheMap = new ConcurrentHashMap<>();

    /**
     * 无效注解方法缓存用于快速返回
     */
    private final Set<String> invalidCacheSet = new ConcurrentHashSet<>();

    /**
     * spel 解析器
     */
    private final ExpressionParser parser = new SpelExpressionParser();
    private final ParserContext parserContext = new TemplateParserContext();
    /**
     * bean解析器 用于处理 spel 表达式中对 bean 的调用
     */
    private final BeanResolver beanResolver = new BeanFactoryResolver(SpringUtil.getBeanFactory());

    public Expression getSqlSegment(Expression where, String mappedStatementId, boolean isSelect) {
        PermissionFilter permissionFilter = findAnnotation(mappedStatementId);
        if (Objects.isNull(permissionFilter) || permissionFilter.disabled()) {
            invalidCacheSet.add(mappedStatementId);
            return where;
        }

        // FIXME 如果是超级管理员，则不过滤数据
        if (false) {
            return where;
        }
        String dataFilterSql = buildDataFilter();
        if (StringUtils.isBlank(dataFilterSql)) {
            return where;
        }
        try {
            Expression expression = CCJSqlParserUtil.parseExpression(dataFilterSql);
            // 数据权限使用单独的括号 防止与其他条件冲突
            Parenthesis parenthesis = new Parenthesis(expression);
            if (ObjectUtil.isNotNull(where)) {
                return new AndExpression(where, parenthesis);
            } else {
                return parenthesis;
            }
        } catch (JSQLParserException e) {
            throw new CustomizeException("数据权限解析异常 => " + e.getMessage());
        }
    }

    /**
     * 构造数据过滤sql
     */
    private String buildDataFilter() {
        // 更新或删除需满足所有条件
        StandardEvaluationContext context = new StandardEvaluationContext();
        context.setBeanResolver(beanResolver);
        // 解析 sql 模板并填充
        org.springframework.expression.Expression expression = parser.parseExpression(DataScopeType.ORG_LIST_AND_CHILD.getSqlTemplate(), parserContext);
        return expression.getValue(context, String.class);
    }

    private PermissionFilter findAnnotation(String mappedStatementId) {
        StringBuilder sb = new StringBuilder(mappedStatementId);
        int index = sb.lastIndexOf(".");
        String clazzName = sb.substring(0, index);
        String methodName = sb.substring(index + 1, sb.length());
        Class<?> clazz = ClassUtil.loadClass(clazzName);
        List<Method> methods = Arrays.stream(ClassUtil.getDeclaredMethods(clazz))
                .filter(method -> method.getName().equals(methodName)).toList();
        PermissionFilter permissionFilter = null;
        // 获取方法注解
        for (Method method : methods) {
            permissionFilter = permissionFilterCacheMap.get(mappedStatementId);
            if (Objects.nonNull(permissionFilter)) {
                return permissionFilter;
            }
            if (AnnotationUtil.hasAnnotation(method, PermissionFilter.class)) {
                permissionFilter = AnnotationUtil.getAnnotation(method, PermissionFilter.class);
                permissionFilterCacheMap.put(mappedStatementId, permissionFilter);
                return permissionFilter;
            }
        }
        permissionFilter = permissionFilterCacheMap.get(clazz.getName());
        if (ObjectUtil.isNotNull(permissionFilter)) {
            return permissionFilter;
        }
        // 获取类注解
        if (AnnotationUtil.hasAnnotation(clazz, PermissionFilter.class)) {
            permissionFilter = AnnotationUtil.getAnnotation(clazz, PermissionFilter.class);
            permissionFilterCacheMap.put(clazz.getName(), permissionFilter);
            return permissionFilter;
        }
        return null;
    }

    /**
     * 是否为无效方法 无数据权限
     */
    public boolean isInvalid(String mappedStatementId) {
        return invalidCacheSet.contains(mappedStatementId);
    }
}