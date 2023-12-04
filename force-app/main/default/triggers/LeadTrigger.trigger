trigger LeadTrigger on Lead (before insert, before update, after insert, after update) {



    switch on Trigger.operationType {
        when BEFORE_INSERT {
            LeadTriggerHandler.beforeInsertHandler(Trigger.new);
        }

        when BEFORE_UPDATE {
            LeadTriggerHandler.beforeUpdateHandler(Trigger.new,Trigger.oldMap);
        }

        when AFTER_UPDATE {
            LeadTriggerHandler.afterUpdateHandler(Trigger.new, Trigger.oldMap);
        }
    }
}