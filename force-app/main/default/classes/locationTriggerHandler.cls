public with sharing class locationTriggerHandler {
    public static void beforeInsert(List<Location__c> locations){
        for (Location__c location : locations) {
            location.Status__c = 'Green';
        }
    }

    public static void beforeUpdate(List<Location__c> locations, Map<Id,Location__c> locationsMap){
        for (Location__c location : locations) {
            if (location.Status__c != locationsMap.get(location.Id).Status__c) {
                location.Status_Update_Date__c = system.today();
            }
        }
    }

    public static void afterUpdate(List<Location__c> locations, Map<Id,Location__c> locationsMap){
        List<Location__c> locationsUpdatedToRed = new List<Location__c>();
        List<Id> yellowToUpdateIds = new List<Id>();

        for (Location__c location : locations) {
            if (location.Status__c != locationsMap.get(location.Id).Status__c) {
                locationsUpdatedToRed.add(location);
            }
        }
        List<Location_Tracing__c> locationsVisited = [SELECT Id, Person__c, Person__r.Health_Status__c, Visit_Date__c
                                                     FROM Location_Tracing__c WHERE Location__c IN :locationsUpdatedToRed AND Visit_Date__c = LAST_N_DAYS:10];
        for (Location_Tracing__c location : locationsVisited) {
            yellowToUpdateIds.add(location.Person__c);
        }
        List<Person__c> yellowToUpdatePeople = [SELECT Id, Health_Status__c FROM Person__c WHERE Id IN :yellowToUpdateIds];
        for (Person__c person : yellowToUpdatePeople) {
            if (person.Health_Status__c != 'Red' && person.Health_Status__c != 'Orange') {
                person.Health_Status__c = 'Yellow';
            }
        }

        update yellowToUpdatePeople;
    }
}