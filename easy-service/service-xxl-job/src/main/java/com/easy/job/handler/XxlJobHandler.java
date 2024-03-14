package com.easy.job.handler;

import com.xxl.job.core.handler.annotation.XxlJob;
import org.springframework.stereotype.Component;

/**
 * </p>
 *
 * @author Matt
 */
@Component
public class XxlJobHandler {
    @XxlJob("easyCloud")
    public void doSomeThing() {
        System.out.println("执行xxl");
    }
}