public with sharing class CTLocationController {
    
    public List<Location__c> getRecentStatusChanges(){
        List<Location__c> locationsQueried = [SELECT 	Address__c, CreatedById, LastModifiedById, Name, OwnerId, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c
                                        FROM Location__c ORDER BY Status_Update_Date__c DESC LIMIT 100  ];
        if (locationsQueried != null && locationsQueried.size() > 0) {
            return locationsQueried;
        }
        return null;
    }

    public List<Location__c> searchLocations(String searchTerm){
        searchTerm = searchTerm + '%';
        List<Location__c> locations = [SELECT Address__c, CreatedById, LastModifiedById, Name, OwnerId, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c
                                        FROM Location__c WHERE Name LIKE :searchTerm OR Pincode__c LIKE :searchTerm OR Address__c LIKE :searchTerm
                                        ORDER BY Status_Update_Date__c DESC NULLS LAST];
        return locations;
    }

    public Location__c getLocationById (String locationId){
        List<Location__c> location = [SELECT 	Address__c, CreatedById, LastModifiedById, Name, OwnerId, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c
        FROM Location__c WHERE Id = :locationId ];

        if(location != null && location.size() > 0){
            return location[0];
        }
        return null;
    }
    
    public Map<String,Integer> getStatusCount(){
        Map<String,Integer> statusToCountMap = new Map <String,Integer>();
        
        AggregateResult[] groupedLocation = [SELECT Status__c, COUNT(Id) id FROM Location__c GROUP BY Status__c];
        
        for(AggregateResult res : groupedLocation){
            statusToCountMap.put(String.valueOf(res.get('Status__c')), Integer.valueOf(res.get('id')));
        }
        system.debug(statusToCountMap);
        return statusToCountMap;
    }
}