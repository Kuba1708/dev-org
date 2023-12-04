@isTest
public with sharing class TestAccountDeletion {
    @isTest public static void TestDeletionOneAccountWithOneOpportunity() {
        Account[] accts = TestDataFactory.createAccountsWithOpps(1, 1);

        Test.startTest();
        Database.DeleteResult result = Database.Delete(accts[0],false);
        Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete Account with related opportunities', result.getErrors()[0].getMessage());
    }

    @isTest public static void TestDeletionMultipleAccountsWithoutOpportunity() {
        Account[] accts = TestDataFactory.createAccountsWithOpps(2,0);

        Test.startTest();
            Database.DeleteResult[] results = Database.delete(accts,false);
        Test.stopTest();

        for(Database.DeleteResult result : results){
            System.assert(result.isSuccess());
        }
    }

    @isTest public static void TestDeletionMultipleAccountsWithOpportunities(){
        Account[] accts = TestDataFactory.createAccountsWithOpps(10, 10);

        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts,false);
        Test.stopTest();

        for(Database.DeleteResult result : results) {
            System.assert(!result.isSuccess());
            System.assertEquals('Cannot delete Account with related opportunities', result.getErrors()[0].getMessage());
        }
    }
}