public with sharing class TaskUtil {
    public static String GetTaskPriority(String LeadState) {
        String taskPriority;
        if (LeadState == null || LeadState.length() > 2) {
            taskPriority = null;
        }else if (LeadState == 'CA') {
            taskPriority = 'High';
        }else {
            taskPriority = 'Normal';
        }
        system.debug(taskPriority);
        return taskPriority;
    }
}