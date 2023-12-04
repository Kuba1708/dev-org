@isTest
public with sharing class CTPeopleTracingControllerTest {
    
    @isTest
    public static void getTraceTestPositive(){
        People_Tracing__c pp = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue43UAB', Person_2__c = 'a0M7S00000Aue3xUAB', Contact_Date__c = Date.today());
        insert pp;
		System.assertEquals(1, CTPeopleTracingController.getTraces(pp.Id).size());
    }
    
    @isTest
    public static void getTraceTestNegative(){
        String recordId = '123123123';
        
		System.assertEquals(0, CTPeopleTracingController.getTraces(recordId).size());
    }
    
    @isTest
    public static void testDuplicates(){
        // create duplicate record with same Person_1__c and Person_2__c
        People_Tracing__c dupRecord = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue42UAB', Person_2__c = 'a0M7S00000Aue3xUAB');
        People_Tracing__c dupRecord2 = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue42UAB', Person_2__c = 'a0M7S00000Aue3xUAB', Contact_Date__c = Date.today());
        List<People_Tracing__c> dupList = new List<People_Tracing__c>();
        dupList.add(dupRecord);
        insert dupRecord2;
        CTPeopleTracingController.checkDuplicates(dupList);
        System.assertEquals(1, dupList.size());
    }
    
    @isTest
    public static void testDuplicatesWithChangedOrder(){
        People_Tracing__c dupRecord = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue42UAB', Person_2__c = 'a0M7S00000Aue3xUAB');
        People_Tracing__c dupRecord2 = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue3xUAB', Person_2__c = 'a0M7S00000Aue42UAB', Contact_Date__c = Date.today());
        List<People_Tracing__c> dupList = new List<People_Tracing__c>();
        dupList.add(dupRecord);
        insert dupRecord2;
        System.assertEquals(1, CTPeopleTracingController.checkDuplicates(dupList).size());
    }
    
    @isTest
    public static void testDuplicatesWithChangedOrder2(){
        People_Tracing__c dupRecord = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue42UAB', Person_2__c = 'a0M7S00000Aue3xUAB');
        People_Tracing__c dupRecord2 = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue3xUAB', Person_2__c = 'a0M7S00000Aue42UAB', Contact_Date__c = Date.today());
        List<People_Tracing__c> dupList = new List<People_Tracing__c>();
        dupList.add(dupRecord);
        insert dupRecord2;
        CTPeopleTracingController.checkDuplicates(dupList);
        System.assertEquals(1, CTPeopleTracingController.checkDuplicates(dupList).size());
    }
    
    @isTest
    public static void testWithNoDuplicates(){
        People_Tracing__c firstRecord = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue42UAB', Person_2__c = 'a0M7S00000Aue3xUAB');
        People_Tracing__c secondRecord = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue47UAB', Person_2__c = 'a0M7S00000Aue43UAB');
        List<People_Tracing__c> listRecord = new List<People_Tracing__c>();
        listRecord.add(firstRecord);
        insert secondRecord;
        CTPeopleTracingController.checkDuplicates(listRecord);
        System.assertEquals(0, CTPeopleTracingController.checkDuplicates(listRecord).size());
    }
    
    @isTest
    public static void testWithOneDuplicate(){
        People_Tracing__c firstRecord = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue47UAB', Person_2__c = 'a0M7S00000Aue3xUAB');
        People_Tracing__c secondRecord = new People_Tracing__c(Person_1__c = 'a0M7S00000Aue47UAB', Person_2__c = 'a0M7S00000Aue43UAB');
        List<People_Tracing__c> listRecord = new List<People_Tracing__c>();
        listRecord.add(firstRecord);
        insert secondRecord;
        CTPeopleTracingController.checkDuplicates(listRecord);
        System.assertEquals(0, CTPeopleTracingController.checkDuplicates(listRecord).size());
    }
}