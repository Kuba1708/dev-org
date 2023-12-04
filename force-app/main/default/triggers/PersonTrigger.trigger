trigger PersonTrigger on Person__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            PersonTriggerHandler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE {
            PersonTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
        when AFTER_UPDATE{
            PersonTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
        }

    }
}