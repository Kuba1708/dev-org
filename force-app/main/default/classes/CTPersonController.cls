public with sharing class CTPersonController {
    public static String getToken(String mobile){
        
        Blob value = Blob.valueOf(mobile);
        BLob hash = Crypto.generateDigest('MD5', value);
        
        return EncodingUtil.base64Encode(hash);
    }

    public List<Person__c> getRecentHealthChanges(){
        List<Person__c> personList = [SELECT CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, OwnerId, Status_Update_Date__c, Token__c 
                                      FROM Person__c ORDER BY Status_Update_Date__c DESC LIMIT 100 ];
        return personList;
    }

    public List<Person__c> searchPeople (String searchTerm){
        searchTerm = searchTerm +'%';
        List<Person__c> searchedList = [SELECT CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, OwnerId, Status_Update_Date__c, Token__c FROM Person__c
        WHERE Name LIKE :searchTerm OR Mobile__c LIKE :searchTerm OR Token__c LIKE :searchTerm 
        ORDER  BY Status_Update_Date__c DESC NULLS LAST];
        return searchedList;
    }

    public Person__c getPersonById(String personId){
        Person__c person = [SELECT CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, OwnerId, Status_Update_Date__c, Token__c
        FROM Person__c WHERE Id = :personId LIMIT 1 ];
        if (person != null) {
            return person;
        }
        return null;
    }
}