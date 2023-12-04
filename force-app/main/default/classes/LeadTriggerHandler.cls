public with sharing class LeadTriggerHandler {
    // Boolean variable to avoid recursive creation and invoking the trigger after new nester lead is created in beforeInsertHandler
    public static Boolean alreadyExecuted = false;
    public static void beforeInsertHandler(List<Lead> leadsFromTriggerBeforeInsert) {
        for(Lead leadRecord : leadsFromTriggerBeforeInsert){
            if(String.isBlank(leadRecord.LeadSource)){
                leadRecord.LeadSource = 'Other';
            }

            if(String.isBlank(leadRecord.Industry)){
                leadRecord.addError('The industry field cannot be empty. Error from LeadTrigger.');
            }    
        }
        if (LeadTriggerHandler.alreadyExecuted == false) {
            alreadyExecuted = true;
            Lead anotherLead = new Lead(LastName = 'Trigger Test ' + System.today(), Status = 'Open - Not Contacted', Industry = 'Technology');
            insert anotherLead;
        }
    }

    public static void beforeUpdateHandler(List<Lead> newListLead, Map<Id,Lead> newMapLead){
        for (Lead leadRecord : newListLead) {           
            if(String.isBlank(leadRecord.LeadSource)){
                leadRecord.LeadSource = 'Other';
            }
            if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') &&
                (newMapLead.get(leadRecord.Id).Status != 'Working - Contacted')){
                    leadRecord.Status.addError('Cannot convert status from blank or not contacted status. error from LeadTrigger');
            }
        }
    }

    public static void afterUpdateHandler(List<Lead> updatedLeadList, Map<Id,Lead> oldAfterUpdateMap){
        List<Task> taskToCreate = new List<Task>();
            Integer i = 0;
            for (Lead leadRecord : updatedLeadList) {
                i++;
                if(leadRecord.Status != oldAfterUpdateMap.get(LeadRecord.Id).Status){
                Task leadTask = new Task(
                    WhoId = leadRecord.Id,
                    Subject = 'Follow up for Lead Task',
                    ActivityDate = System.today(),
                    OwnerId = UserInfo.getUserId(),
                    Description = 'Task created from the LeadTrigger'
                );
                taskToCreate.add(leadTask);
                }
            }
            if(taskToCreate.size()>0){
                insert taskToCreate;
            }
    }
}