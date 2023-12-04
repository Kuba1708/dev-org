public with sharing class PersonTriggerHandler {
    public static void beforeInsert(List<Person__c> persons){
        for (Person__c person : persons) {
            person.Health_Status__c = 'Green';
            person.Token__c = CTPersonController.getToken(person.Mobile__c);
        }
    }

    public static void beforeUpdate(List<Person__c> persons, Map<Id,Person__c> personMap){
        List<Id> personIdsWithChangedStatus = new List<Id>();
        List<Id> personsWithChangedToRed = new List<Id>();
        Map<Id,String> IdToMeetingType = new Map<Id,String>();

        for (Person__c person : persons) {
            if (person.Health_Status__c != personMap.get(person.Id).Health_Status__c) {
                person.Status_Update_Date__c = system.today();
                personIdsWithChangedStatus.add(person.Id);

                if (person.Health_Status__c == 'Red') {
                    personsWithChangedToRed.add(person.Id);
                }
            }
        }

        List<People_Tracing__c> peopleTracingList = [SELECT Id, Person_1__c, Person_2__c, Contact_Type__c FROM People_Tracing__c WHERE Person_1__c IN :personIdsWithChangedStatus OR Person_2__c IN :personIdsWithChangedStatus];
        for (People_Tracing__c ppl : peopleTracingList) {
            for (Id pId : personsWithChangedToRed) {
                if (ppl.Person_1__c == pId) {
                    IdToMeetingType.put(ppl.Person_2__c, ppl.Contact_Type__c);
                }else {
                    IdToMeetingType.put(ppl.Person_1__c, ppl.Contact_Type__c);
                }
            }
        }
        
        List<Person__c> personsToUpdate = [SELECT Id, Name, Health_Status__c FROM Person__c WHERE Id IN :IdToMeetingType.keySet()];
        for (Person__c pr : personsToUpdate) {
            Boolean statusBoolean = pr.Health_Status__c != 'Orange' && pr.Health_Status__c != 'Red';
            if (IdToMeetingType.get(pr.Id) == 'Cohabitant' && statusBoolean ) {
                pr.Health_Status__c = 'Orange';
            }else if (IdToMeetingType.get(pr.Id) == 'Neighbour' || IdToMeetingType.get(pr.Id) == 'Other' && statusBoolean ) {
                pr.Health_Status__c = 'Yellow';
            }
        }   
        update personsToUpdate;
    }

    public static void afterUpdate(List<Person__c> persons, Map<Id,Person__c> personMap){
        List<Id> personIdsWithChangedStatus = new List<Id>();

        for (Person__c person : persons) {
            if (person.Health_Status__c != personMap.get(person.Id).Health_Status__c) {
                personIdsWithChangedStatus.add(person.Id);
            }
        }
        
        // search all locations which person visited in last 10 days
        List<Location_Tracing__c> locationsTracing = [SELECT Id, Location__c, Person__c, Person__r.Health_Status__c, Location__r.Status__c FROM Location_Tracing__c WHERE Person__c IN : personIdsWithChangedStatus AND Visit_Date__c = LAST_N_DAYS:10 ];

        // map of all locations which are related to locations visited in last days, with id of the location and stirng of the new status
        Map<Id,String> locationToStatusMap = new Map<Id,String>();
        
        if (locationsTracing != null) {
            system.debug(locationsTracing);
            for (Location_Tracing__c locationTrace : locationsTracing) {
                locationToStatusMap.put(locationTrace.Location__c, locationTrace.Person__r.Health_Status__c);
            }    
            system.debug(locationToStatusMap);
        }

        if (locationToStatusMap != null) {
            List<Location__c> locationsToUpdate = [SELECT Id, Status__c, Red_Score__c FROM Location__c WHERE Id IN :locationToStatusMap.keySet()];
            for (Location__c location : locationsToUpdate) {
                location.Status__c = locationToStatusMap.get(location.Id);
                if (locationToStatusMap.get(location.Id) != 'Green' && locationToStatusMap.get(location.Id) != 'Yellow') {
                    location.Red_Score__c += 1;
                }
            }
            system.debug(locationsToUpdate);
            update locationsToUpdate;
        }
    }
}