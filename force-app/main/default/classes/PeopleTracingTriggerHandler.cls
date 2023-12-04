public with sharing class PeopleTracingTriggerHandler {
    public static void beforeInsert(List<People_Tracing__c> newPeopleTracing){
        List<People_Tracing__c> allPeopleTracing = [SELECT Id, Person_1__c, Person_2__c, Contact_Date__c, Contact_Type__c FROM People_Tracing__c];

        for (People_Tracing__c peopleTrace : newPeopleTracing) {
            for (People_Tracing__c peopleTraceAll : allPeopleTracing) {
                if ((peopleTrace.Person_1__c == peopleTraceAll.Person_1__c || peopleTrace.Person_1__c == peopleTraceAll.Person_2__c)&&
                    (peopleTrace.Person_2__c == peopleTraceAll.Person_1__c || peopleTrace.Person_2__c == peopleTraceAll.Person_2__c) &&
                    peopleTrace.Contact_Date__c == peopleTraceAll.Contact_Date__c &&
                    peopleTrace.Contact_Type__c == peopleTraceAll.Contact_Type__c) {
                    peopleTrace.addError('Detected duplicate, please check existing records');
                }
            }
        }
    }
}