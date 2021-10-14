package com.example.flowable.domain.constants;

/**
 * 放与工作流相关常量
 *
 * @author yipeng.song
 * @date 2021/5/11
 */
public abstract class UMFlowableConstants {

    // 以下是流程操作的标识
    // 发起流程
    public final static String startName = "发起申请";
    public final static String startAction = "start";
    // 审核通过
    public final static String passName = "审核通过";
    public final static String passAction = "passTask";
    // 审核通过
    public final static String rejectName = "驳回单据";
    public final static String rejectAction = "rejectTask";
    // 会签
    public final static String addMulitiInstanceAction = "addMulitiInstanceAction";
    public final static String addMulitiInstance = "addMulitiInstance";
    public final static String addMulitiInstanceName = "会签";
    // 前加签
    public final static String addSignBeforeAction = "addSignBeforeAction";
    public final static String addSignBefore = "addSignBefore";
    public final static String addSignBeforeName = "前加签";
    // 后加签
    public final static String addSignAfterAction = "addSignAfterAction";
    public final static String addSignAfter = "addSignAfter";
    public final static String addSignAfterName = "后加签";
    // 抄送
    public final static String makeACopyForAction = "makeACopyForAction";
    public final static String makeACopyFor = "makeACopyFor";
    public final static String makeACopyForName = "抄送";

    // 抄送标识
    public final static String hasReadName = "已读";
    public final static String hasReadAction= "hasRead";

    // 删除流程
    public final static String deleteProInstAciton = "deleteProInstAction";
    public final static String delProInstName = "作废流程";

    // 委派任务动作标识
    public final static String delegateTaskAction = "delegateAction";
    public final static String delegateTask = "delegateTask";
    public final static String delegateTaskName = "委托任务";

    // 撤回流程实例
    public final static String revokeProInstAction = "revokeProcInstAction";
    // public final static String revokeProInst = "revoke";
    public final static String revokeProInstName = "撤回单据";


    // 以下是任务的类型
    public final static String userTask = "userTask";


    // 以下是任务状态
    public final static String pass = "pass";
    public final static String reject = "reject";


    // 以下是单据的状态
    // 提交状态（草稿箱）
    public final static Integer BUSINESSBILL_STATUS_O = 0;
    // 已提交进入审核状态
    public final static Integer BUSINESSBILL_STATUS_1 = 1;
    // 审核完成
    public final static Integer BUSINESSBILL_STATUS_2 = 2;
    // 打回
    public final static Integer BUSINESSBILL_STATUS_3 = -1;
    // 删除
    public final static Integer BUSINESSBILL_STATUS_4 = -2;


    // 以下是流程状态
    // 流程业务未发布
    public final static Integer UNPUBLISHED = 0;
    // 流程业务已发布
    public final static Integer PUBLISHED = 1;
    // 流程业务启用
    public final static Integer ENABLE_STATUS_1 = 1;
    // 流程业务停用
    public final static Integer ENABLE_STATUS_0 = 0;
    // 单据可撤回
    public final static Integer Retract = 1;


    // bpmn文件后缀
    public final static String FILE_SUFFIX = ".bpmn20.xml";

    // 其他
    public final static String ASSIGNEE_USER_ = "${assignee}";
    public final static String ASSIGNEE_USER = "assignee";
    public final static String DEFAULT_ASSIGNEE_LIST = "${assigneeList}";
    public final static String ASSIGNEE_LIST = "assigneeList";

    // 抄送身份
    // public final static String nofity = "nofity";


    // bpmn文件命名空间
    public final static String targetNamespace="http://www.flowable.org/processdef";
    public final static String isAddSign = "isAddSign";
    public final static String isDelegate = "isDelegate";



    // 以下是流程参与人和候选人等角色
    /**
     * 流程拥有者 ->往往与表单相关 在流程
     */
    public final static String FLOW_USER_KEY = "flowOwner";

    public final static String FLOW_START_USER_KEY = "flowStarter";

    public final static String FLOW_ORGANIZATION_KEY = "flowOrganization";

    // 上级候选人
    public final static String USERLIST_TYPE = "userList";
    // 上级候选人
    public final static String SUPERIOR_TYPE = "superior";
    // 部门职位候选人
    public final static String ORGANAZATION_POSITION_TYPE = "position";
    // 部门角色候选人
    public final static String ORGANAZATION_ROLE_TYPE = "organizationRole";
    // 部门负责人候选人
    public final static String DEPARTMENT_LEADER_TYPE = "departmentLeader";
    // 本部门负责人候选人
    public final static String SELFDEPARTMENT_LEADER_TYPE = "selfDepartmentLeader";



    // 以下是可提单角色
    // 按角色选择
    public final static String BILL_AUTHORITY_ROLE = "authorityRole";
    // 按部门选择
    public final static String BILL_AUTHORITY_DEPT = "authorityDept";
    // 按人员选择
    public final static String BILL_AUTHORITY_USER = "authorityUser";


    /**
     * 启用后加签比例通过
     * 流程启动时携带此参数且为true
     * 并带上比例
     */
    public final static String ENABLE_ADD_SIGN_AFTER_RATE = "enable_add_sign_after_rate";

    /**
     * 后加签比例
     */
    public final static String ADD_SIGN_AFTER_RATE = "add_sign_after_rate";

}
