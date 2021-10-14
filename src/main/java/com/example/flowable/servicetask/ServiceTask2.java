package com.example.flowable.servicetask;

import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component("serviceTask2")
public class ServiceTask2 implements Serializable {

    public String invoke() {
        System.out.println("服务任务节点");
        return "wwm";
    }
}
