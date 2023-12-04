public with sharing class CTLocationTracingController {
    
    public List<Location_Tracing__c> getVisitors (String locationId){
        List<Location_Tracing__c> location = [SELECT Id, CreatedById, LastModifiedById, Location__c, Name, Person__c, Visit_Date__c
        FROM Location_Tracing__c WHERE Id = :locationId ORDER BY Visit_Date__c DESC ];

        if(location != null && location.size() > 0){
            return location;
        }
        return null;
    }

    public List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds){
        List <Location_Tracing__c> locations = [SELECT Id, CreatedById, LastModifiedById, Location__c, Name, Person__c, Visit_Date__c
                                        FROM Location_Tracing__c WHERE Person__c IN :personIds AND Visit_Date__c > LAST_N_DAYS:10];
        if (locations.size()>0) {
            return locations;
        }
        return null;
    }

    public List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
        List<Location_Tracing__c> locations = [SELECT Id, CreatedById, LastModifiedById, Location__c, Name, Person__c, Visit_Date__c
                                                FROM Location_Tracing__c 
                                                WHERE Location__c IN :locationIds AND Visit_Date__c > LAST_N_DAYS:10 AND Person__r.Health_Status__c = 'Green' ];
        if(locations != null){
            return locations;
        }
        return locations;
    }

}