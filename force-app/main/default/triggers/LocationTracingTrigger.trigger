trigger LocationTracingTrigger on Location_Tracing__c (before insert, after insert) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            LTTriggerHandler.beforeInsert(Trigger.new);            
        }
        when else {
            
        }
    }
}