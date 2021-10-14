package com.example.flowable.config;

import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineLifecycleListener;

public class UMProcessEngineLifecycleListener implements ProcessEngineLifecycleListener {


    /**
     * 监听引擎启动
     *
     * @param processEngine
     */
    @Override
    public void onProcessEngineBuilt(ProcessEngine processEngine) {
        System.out.println("UMProcessEngineLifecycleListener:onProcessEngineBuilt:" + processEngine);
    }


    /**
     * 监听引擎关闭
     *
     * @param processEngine
     */
    @Override
    public void onProcessEngineClosed(ProcessEngine processEngine) {
        System.out.println("UMProcessEngineLifecycleListener:onProcessEngineClosed:" + processEngine);
    }
}
