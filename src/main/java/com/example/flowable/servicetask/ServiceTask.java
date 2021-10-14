package com.example.flowable.servicetask;

import org.flowable.common.engine.api.delegate.Expression;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.delegate.JavaDelegate;
import org.springframework.stereotype.Component;

@Component("serviceTask")
public class ServiceTask implements JavaDelegate {

    Expression age;

    @Override
    public void execute(DelegateExecution execution) {
        //  测试服务任务节点力流程，到时候写总结记得重点
        System.out.println(age);
        String expressionText = age.getExpressionText();
        System.out.println(expressionText);
        Object value = age.getValue(execution);
        System.out.println(value);
        execution.setVariable("key1", "value1");
    }
}
