@isTest
public with sharing class AccountEmailTest {
    @isTest
    public static void getEmailTest(){
        RecordType recordType = [SELECT Id FROM RecordType WHERE SobjectType = 'Account' AND DeveloperName = 'Person' LIMIT 1];
        Map<Id,String> employeeIdToEmail = new Map<Id,String>();
        Map<Id,String> employeeIdToEmpty = new Map<Id,String>();
        
        List<Account> accountsToInsert = new List<Account>();
        accountsToInsert.add(new Account(Name = 'Test Account', PersonEmail = 'email@test.com', RecordTypeId = recordType.Id ));
        accountsToInsert.add(new Account(Name = 'Test Account2', PersonEmail = '', RecordTypeId = recordType.Id));

        insert accountsToInsert;

        Account insertedWithEmail = [SELECT Id, PersonEmail FROM Account WHERE Name = 'Test Account' LIMIT 1];
        Account insertedWithNoEmail = [SELECT Id, PersonEmail FROM Account WHERE Name = 'Test Account2' LIMIT 1];

        
        employeeIdToEmail.put(insertedWithEmail.Id, insertedWithEmail.PersonEmail);
        employeeIdToEmpty.put(insertedWithNoEmail.Id, insertedWithNoEmail.PersonEmail);
        
        System.assertEquals('email@test.com', AccountEmail.getAccountEmail(employeeIdToEmail, insertedWithEmail.Id));
        System.assertEquals('info@apexsandbox.io', AccountEmail.getAccountEmail(employeeIdToEmpty, insertedWithNoEmail.Id));
        
        }
        }