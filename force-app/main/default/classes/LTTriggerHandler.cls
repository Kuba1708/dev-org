public with sharing class LTTriggerHandler {
    public static void beforeInsert(List<Location_Tracing__c> locationTracing){
        List<Location_Tracing__c> allTracing = [SELECT Id, Person__c, Location__c, Visit_Date__c FROM Location_Tracing__c];

        for (Location_Tracing__c lTrace : locationTracing) {
            for (Location_Tracing__c allTrace : allTracing) {
                if (lTrace.Person__c == allTrace.Person__c &&
                    lTrace.Location__c == allTrace.Location__c &&
                    lTrace.Visit_Date__c == allTrace.Visit_Date__c) {
                    lTrace.addError('Duplicate detected, check existing records');
                }
            }
        }
    }
}