package com.example.flowable;

import com.example.flowable.domain.constants.UMFlowableConstants;
import org.flowable.bpmn.converter.BpmnXMLConverter;
import org.flowable.bpmn.model.*;
import org.flowable.bpmn.model.Process;
import org.flowable.common.engine.impl.identity.Authentication;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.impl.persistence.entity.HistoricActivityInstanceEntity;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.identitylink.api.history.HistoricIdentityLink;
import org.flowable.spring.SpringProcessEngineConfiguration;
import org.flowable.task.api.Task;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.validation.ProcessValidator;
import org.flowable.validation.ProcessValidatorFactory;
import org.flowable.validation.ValidationError;
import org.flowable.variable.api.history.HistoricVariableInstance;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest(classes = FlowableDemoApplication.class)
class FlowableDemoApplicationTests {


    @Autowired
    private ProcessEngine processEngine;

    @Autowired
    private SpringProcessEngineConfiguration configuration;

    @Autowired
    private RuntimeService runtimeService;


    @Test
    void contextLoads() {
    }


    /**
     * 部署 Bpmn 文件
     */
    @Test
    public void deploy() {
        Deployment deployment = processEngine.getRepositoryService()
                .createDeployment()
                .addClasspathResource("脚本任务测试3.bpmn20.xml")
                .deploy();
        ProcessDefinition processDefinition = processEngine.getRepositoryService()
                .createProcessDefinitionQuery()
                .deploymentId(deployment.getId())
                .singleResult();
        System.out.println(processDefinition.getId());
    }


    /**
     * 查看已经部署过的流程
     */
    @Test
    public void findProcessDefinition() {
        try {
            List<ProcessDefinition> list = processEngine.getRepositoryService().createProcessDefinitionQuery().list();
            for (ProcessDefinition processDefinition : list) {
                System.out.println("流程定义保存的id：" + processDefinition.getId());
                System.out.println("流程定义部署的id：" + processDefinition.getDeploymentId());
                System.out.println("流程定义的key：" + processDefinition.getKey());
                System.out.println("流程定义部署后的版本：" + processDefinition.getVersion());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 流程启动
     */
    @Test
    public void testStart() {
        try {
            Map<String, Object> startParams = new HashMap<>();
            // 一起将流程发起人、拥有人和当时所属的部门id传递给流程变量
            startParams.put(UMFlowableConstants.FLOW_START_USER_KEY, 1336619802308997012L);
            startParams.put(UMFlowableConstants.FLOW_USER_KEY, 1336619802308997012L);
            startParams.put(UMFlowableConstants.FLOW_ORGANIZATION_KEY, 300l);

            // 脚本任务需要传递的参数
            startParams.put("a", 1);
            startParams.put("b", 2);
            startParams.put("echo", "wwm");

            Authentication.setAuthenticatedUserId("1336619802308997012");
            ProcessInstance processInstance = processEngine.getRuntimeService().startProcessInstanceByKey("scriptTask3", startParams);
            System.out.println(processInstance.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    /**
     * 完成接收任务
     */
    @Test
    public void completerReceivetask() {
        try {
            runtimeService.trigger("69d05fe7-2c8c-11ec-868e-0242fee169b2");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 查看已经启动过流程实例和执行实例
     */
    @Test
    public void findProcessInstance() {
        try {
            List<ProcessInstance> processInstanceList = processEngine.getRuntimeService().createProcessInstanceQuery().list();
            for (ProcessInstance processInstance : processInstanceList) {
                System.out.println("流程实例的id：" + processInstance.getId());
                System.out.println("流程实例的名称：" + processInstance.getName());
                System.out.println("流程部署的id：" + processInstance.getDeploymentId());
                System.out.println("流程实例的启动人：" + processInstance.getStartUserId());
            }

            List<Execution> executionList = processEngine.getRuntimeService().createExecutionQuery().list();
            for (Execution execution : executionList) {
                System.out.println("执行实例的id：" + execution.getId());
                System.out.println("执行实例的名称：" + execution.getName());
                System.out.println("执行实例当前执行到任务节点的id：" + execution.getActivityId());
                System.out.println("执行实例对应的流程实例id：" + execution.getParentId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 查看可以执行的任务
     */
    @Test
    public void findTask() {
        List<Task> taskList = processEngine.getTaskService().createTaskQuery().taskAssignee("1336619802308997013").list();
        for (Task task : taskList) {
            System.out.println("任务的id：" + task.getId());
            System.out.println("任务的名称：" + task.getName());
            System.out.println("任务的受理人：" + task.getAssignee());
            System.out.println("任务所属的流程实例：" + task.getProcessInstanceId());
        }
    }


    /**
     * 执行任务
     */
    @Test
    public void complete() {
        List<Task> taskList = processEngine.getTaskService().createTaskQuery().taskAssignee("1336619802308997013").list();
        for (Task task : taskList) {
            System.out.println("任务的id：" + task.getId());
            System.out.println("任务的名称：" + task.getName());
            System.out.println("任务的受理人：" + task.getAssignee());
            System.out.println("任务所属的流程实例：" + task.getProcessInstanceId());
            System.out.println("通过任务id来执行：" + task.getProcessInstanceId());
            processEngine.getTaskService().complete(task.getId());
        }
    }


    /**
     * 查看历史相关记录
     */
    @Test
    public void findHistory() {
        List<HistoricProcessInstance> historicProcessInstanceList = processEngine.getHistoryService().createHistoricProcessInstanceQuery().list();
        for (HistoricProcessInstance historicProcessInstance : historicProcessInstanceList) {
            System.out.println("历史流程实例的id：" + historicProcessInstance.getId());
            System.out.println("历史流程实例的名称：" + historicProcessInstance.getName());
            System.out.println("历史流程实例当时的流程定义的id：" + historicProcessInstance.getProcessDefinitionId());
            System.out.println("历史流程实例的启动人：" + historicProcessInstance.getStartUserId());
        }

        List<HistoricTaskInstance> historicTaskInstanceList = processEngine.getHistoryService().createHistoricTaskInstanceQuery().list();
        for (HistoricTaskInstance historicTaskInstance : historicTaskInstanceList) {
            System.out.println("历史任务的id s：" + historicTaskInstance.getId());
            System.out.println("历史任务的名称：" + historicTaskInstance.getName());
            System.out.println("历史任务当时所属的流程定义的id：" + historicTaskInstance.getProcessDefinitionId());
            System.out.println("历史任务的受理人：" + historicTaskInstance.getAssignee());
        }


        List<HistoricActivityInstance> historicActivityInstanceList = processEngine.getHistoryService().createHistoricActivityInstanceQuery().list();
        for (HistoricActivityInstance historicActivityInstance : historicActivityInstanceList) {
            System.out.println("------------------------------------------------------------");
            System.out.println("历史节点的id：" + historicActivityInstance.getId());
            System.out.println("历史节点的名称：" + historicActivityInstance.getActivityName());
            System.out.println("历史节点当时所属的流程定义的id：" + historicActivityInstance.getProcessDefinitionId());
            System.out.println("历史节点在xml中的定义：" + historicActivityInstance.getActivityId());
            System.out.println("历史节点类型：" + historicActivityInstance.getActivityType());
        }

        List<HistoricVariableInstance> historicVariableInstanceList = processEngine.getHistoryService().createHistoricVariableInstanceQuery().list();
        for (HistoricVariableInstance historicVariableInstance : historicVariableInstanceList) {
            System.out.println("------------------------------------------------------------");
            System.out.println("历史变量的id：" + historicVariableInstance.getId());
            System.out.println("历史变量的名称：" + historicVariableInstance.getVariableName());
            System.out.println("历史变量所属的流程实例的id：" + historicVariableInstance.getProcessInstanceId());
            System.out.println("历史变量的值：" + historicVariableInstance.getValue());
            System.out.println("历史变量的类型：" + historicVariableInstance.getVariableTypeName());
        }


        List<HistoricIdentityLink> historicIdentityLinkList = processEngine.getHistoryService().getHistoricIdentityLinksForProcessInstance("488d34a6-2bd3-11ec-8634-4e9a93bbb87a");
        List<HistoricIdentityLink> historicIdentityLinkList1 = processEngine.getHistoryService().getHistoricIdentityLinksForTask("48917a6f-2bd3-11ec-8634-4e9a93bbb87a");
        historicIdentityLinkList.addAll(historicIdentityLinkList1);
        for (HistoricIdentityLink historicIdentityLink : historicIdentityLinkList) {
            System.out.println("------------------------------------------------------------");
            System.out.println("历史权限所属的流程实例的id：" + historicIdentityLink.getProcessInstanceId());
            System.out.println("历史权限所属的任务的id：" + historicIdentityLink.getTaskId());
            System.out.println("历史权限的类型：" + historicIdentityLink.getType());
            System.out.println("历史权限人：" + historicIdentityLink.getUserId());
        }
    }


    /**
     * 通过bpmnmodel创建流程
     */
    @Test
    public void createBpmnModel() {
        //实例化BpmnModel对象
        BpmnModel bpmnModel = new BpmnModel();
        //开始节点的属性
        StartEvent startEvent = new StartEvent();
        startEvent.setId("startEvent1");
        startEvent.setName("开始");
        //普通的UserTask节点
        UserTask userTask = new UserTask();
        userTask.setId("userTask1");
        userTask.setName("用户任务1");
        //结束节点属性
        EndEvent endEvent = new EndEvent();
        endEvent.setId("endEvent1");
        endEvent.setName("结束节点");
        //连线信息
        List<SequenceFlow> sequenceFlows = new ArrayList<SequenceFlow>();
        List<SequenceFlow> toEnd = new ArrayList<>();
        SequenceFlow s1 = new SequenceFlow();
        s1.setId("starttouserTask");
        s1.setName("starttouserTask");
        s1.setSourceRef("startEvent1");
        s1.setTargetRef("userTask1");
        sequenceFlows.add(s1);
        SequenceFlow s2 = new SequenceFlow();
        s2.setId("userTasktoend");
        s2.setName("userTasktoend");
        s2.setSourceRef("userTask1");
        s2.setTargetRef("endEvent1");
        toEnd.add(s2);
        startEvent.setOutgoingFlows(sequenceFlows);
        userTask.setOutgoingFlows(toEnd);
        userTask.setIncomingFlows(sequenceFlows);
        endEvent.setIncomingFlows(toEnd);
        //Process对象
        org.flowable.bpmn.model.Process process = new Process();
        process.setId("test");
        process.addFlowElement(startEvent);
        process.addFlowElement(s1);
        process.addFlowElement(userTask);
        process.addFlowElement(s2);
        process.addFlowElement(endEvent);
        bpmnModel.addProcess(process);

        Deployment deployment = processEngine.getRepositoryService().createDeployment().addBpmnModel("test.bpmn20.xml", bpmnModel).deploy();
        System.out.println(deployment.getId());

    }


    /**
     * 通过bpmnmodel获取节点信息
     */
    @Test
    public void getFlowElemet() {
        BpmnModel bpmnModel = processEngine.getRepositoryService().getBpmnModel("test:1:e7e0ae60-2bfb-11ec-b5bb-4e9a93bbb87a");
        UserTask userTask = (UserTask) bpmnModel.getFlowElement("userTask1");
        System.out.println(userTask.getName());
    }


    /**
     * 通过bpmnmodel获取节点信息
     */
    @Test
    public void bpmnmodelToXml() {
        BpmnModel bpmnModel = processEngine.getRepositoryService().getBpmnModel("test:1:e7e0ae60-2bfb-11ec-b5bb-4e9a93bbb87a");

        BpmnXMLConverter bpmnXMLConverter = new BpmnXMLConverter();

        byte[] convertToXML = bpmnXMLConverter.convertToXML(bpmnModel);

        String bytes = new String(convertToXML);

        System.out.println(bytes);

    }

    /**
     * 校验 bpmnmodel 是否符合 bpmn2.0 要求
     */
    @Test
    public void validateBpmnmodel() {

        BpmnModel bpmnModel = processEngine.getRepositoryService().getBpmnModel("test:1:e7e0ae60-2bfb-11ec-b5bb-4e9a93bbb87a");

        //验证bpmnModel 是否是正确的bpmn xml文件
        ProcessValidatorFactory processValidatorFactory=new ProcessValidatorFactory();

        ProcessValidator defaultProcessValidator = processValidatorFactory.createDefaultProcessValidator();

        //验证失败信息的封装ValidationError

        List<ValidationError> validate = defaultProcessValidator.validate(bpmnModel);

        System.out.println(validate.size());

    }


    @Test
    public void buildEngine1() {

        ProcessEngineConfiguration standaloneProcessEngineConfiguration = ProcessEngineConfiguration.createStandaloneProcessEngineConfiguration();
        standaloneProcessEngineConfiguration.setJdbcDriver("com.mysql.cj.jdbc.Driver");
        standaloneProcessEngineConfiguration.setJdbcUrl("jdbc:mysql://192.168.132.38:3309/flowable_test?useUnicode=true&characterEncoding=UTF-8");
        standaloneProcessEngineConfiguration.setJdbcUsername("ws");
        standaloneProcessEngineConfiguration.setJdbcPassword("unionmanws");
        processEngine = standaloneProcessEngineConfiguration.buildProcessEngine();
        System.out.println(processEngine);
    }


    @Test
    public void buildEngine4() {
        InputStream inputStream = FlowableDemoApplicationTests.class.getClassLoader().getResourceAsStream("flowable.cfg.xml1");
        String beanName="umProcessEngineConfiguration";
        ProcessEngineConfiguration processEngineConfigurationFromInputStream = ProcessEngineConfiguration.createProcessEngineConfigurationFromInputStream(inputStream, beanName);
        processEngine = processEngineConfigurationFromInputStream.buildProcessEngine();
        System.out.println(processEngine);
    }

}
