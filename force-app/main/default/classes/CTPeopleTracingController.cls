public with sharing class CTPeopleTracingController {
    public static List<People_Tracing__c> getTraces(String recordId){
        List<People_Tracing__c> people = [SELECT Id, Name, Contact_Date__c, Contact_Type__c, Person_1__c, Person_2__c FROM People_Tracing__c
                                        WHERE Id = :recordId ];
        return people;
    }

    public static List<People_Tracing__c> checkDuplicates(List<People_Tracing__c> peopleTraces){
        List<People_Tracing__c> existingRecords = [SELECT Id, Name, Contact_Date__c, Contact_Type__c, Person_1__c, Person_2__c FROM People_Tracing__c];

        List<People_Tracing__c> duplicateRecords = new List<People_Tracing__c>();

        for (People_Tracing__c pp : peopleTraces) {
            for (People_Tracing__c pp2 : existingRecords) {
                if ((pp.Person_1__c == pp2.Person_1__c || pp.Person_1__c == pp2.Person_2__c) &&
                    (pp.Person_2__c == pp2.Person_1__c || pp.Person_2__c == pp2.Person_2__c) ) {
                    duplicateRecords.add(pp);
                } 
            }
        }
        return duplicateRecords;
    }
}