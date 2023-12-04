@isTest
public with sharing class TaskUtilTest {
    @isTest public static void CheckCA() {
        String taskPriority = TaskUtil.GetTaskPriority('CA');
        system.assertEquals('High', taskPriority);
    }

    @isTest public static void CheckNormal() {
        String taskPriority = TaskUtil.GetTaskPriority('NY');
        system.assertEquals('Normal', taskPriority);
    }

    @isTest public static void CheckNull() {
        String taskPriority = TaskUtil.GetTaskPriority('CAL');
        system.assertEquals(null, taskPriority);
    }
}