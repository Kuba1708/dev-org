@isTest
public with sharing class AccountDeletionTest {
    @isTest
    public static void deletionTest(){
        
        Account newAcc = new Account(Name = 'Acc with related Opp');
        insert newAcc;

        Account insertedAcc = [SELECT Id FROM Account WHERE Name = 'Acc with related Opp' LIMIT 1];
    
        Opportunity newOpp = new Opportunity(
        Name = 'Related Opp',
        StageName = 'Prospecting',
        CloseDate = System.today(),
        AccountId = insertedAcc.Id);

        insert newOpp;
         // Try to delete the Account and catch the error
         Test.startTest();
         try {
             delete newAcc;
         } catch (DmlException e) {
             // Check that the error message is as expected
             System.assert(e.getMessage().contains('Cannot delete Account with related opportunities'));
         }
         Test.stopTest();
     }
   
}