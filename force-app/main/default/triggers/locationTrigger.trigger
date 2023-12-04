trigger locationTrigger on Location__c (before insert, before update, after insert, after update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            locationTriggerHandler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            locationTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
        when AFTER_UPDATE {
            locationTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}