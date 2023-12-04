@isTest
public with sharing class ContactTriggerHandlerTest {

    @TestSetup
    static void makeData(){
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test 1'));
        testAccounts.add(new Account(Name = 'Test 2'));
        testAccounts.add(new Account(Name = 'Test 3'));


        insert testAccounts;

        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(LastName = 'Test Contact 1', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 2', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 3', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 4', AccountId = testAccounts[0].Id));
        testContacts.add(new Contact(LastName = 'Test Contact 5', AccountId = testAccounts[1].Id));


        insert testContacts;
    }

    @isTest 
    public static void afterInsertHandlerTest(){
        
        
        List<Account> accs = [SELECT Id, Active_Contacts__c FROM Account];
        System.assertEquals(3, accs.size());
        System.assertEquals(4, accs[0].Active_contacts__c);
        System.assertEquals(1, accs[1].Active_contacts__c);
        System.assertEquals(null, accs[2].Active_contacts__c);


        List<contact> allContacts = [SELECT Id FROM Contact];
        SYstem.assertEquals(5, allContacts.size());

    }

    @isTest
    public static void afterUpdateHandlerTest1(){

        List<contact> allContacts = [SELECT Id, LastName FROM Contact ];
        for (Contact con : allContacts) {
            if (con.LastName == 'Test Contact 1') {
                con.Active__c = false;
            }
        }

        Test.startTest();
        update allContacts;
        Test.stopTest();

        List<Account> allAccounts = [SELECT Id, Active_contacts__c, LastName FROM Account];
        for (Account acc : allAccounts) {
            if (acc.LastName == 'Test Contact 1') {
                system.assertEquals(3, acc.Active_contacts__c);
            }
        }
        System.assertEquals(5, allContacts.size());
        System.assertEquals(3, allAccounts.size());
    }

    @isTest
    public static void afterUpdateHandlerTest2(){

        List<contact> allContacts = [SELECT Id, LastName FROM Contact];
        List<Account> accList = [SELECT Id, LastName FROM Account WHERE Name = 'Test 2' ];
        for (Contact con : allContacts) {
            if (con.LastName == 'Test Contact 1') {
                con.AccountId = accList[0].id;
            }
        }

        Test.startTest();
        update allContacts;
        Test.stopTest();

        List<Account> allAccounts = [SELECT Id, Active_contacts__c, LastName FROM Account];
        for (Account acc : allAccounts) {
            if (acc.LastName == 'Test 2') {
                system.assertEquals(2, acc.Active_contacts__c);
            }
        }
        System.assertEquals(5, allContacts.size());
        System.assertEquals(3, allAccounts.size());
    }

    @isTest
    public static void afterDeleteHandler(){
        
        List<contact> allContacts = [SELECT Id, LastName FROM Contact ];
        for (Contact con : allContacts) {
            if (con.LastName == 'Test Contact 1') {
                Test.startTest();
                    delete con;
                Test.stopTest();
            }
        }
        
        system.assertEquals(4, allContacts.size() - 1);

        List<Account> allAccounts = [SELECT Id, LastName, Name, Active_contacts__c FROM Account];
        for (Account acc : allAccounts) {
            if (acc.Name == 'Test 1') {
                System.assertEquals(3, acc.Active_contacts__c);
            }
        }
    }

    @isTest 
    public static void afterUndeleteHandler(){
        List<Contact> contactsToDelete = [SELECT Id, LastName FROM Contact WHERE Name IN ('Test Contact 1', 'Test Contact 5')];
        delete contactsToDelete;

        Test.startTest();
        undelete contactsToDelete;
        Test.stopTest();

        List<Account> allAccounts = [SELECT Id, Name, Active_contacts__c FROM Account];
        System.assertEquals(3, allAccounts.size());

        for (Account acc : allAccounts) {
            if (acc.Name == 'Test 1') {
                System.assertEquals(4, acc.Active_contacts__c);
            }
            if (acc.Name == 'Test 2') {
                System.assertEquals(1, acc.Active_contacts__c);
            }
        }

    }
}