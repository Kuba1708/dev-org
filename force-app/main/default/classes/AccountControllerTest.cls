@isTest
public with sharing class AccountControllerTest {
    @TestSetup
    static void makeData(){
        List<Account> accountList = new List<Account>();
        accountList.add(new Account(Name = 'Test 1'));
        accountList.add(new Account(Name = 'Test 2'));
        accountList.add(new Account(Name = 'Test 3'));
        accountList.add(new Account(Name = 'Test 4'));

        AccountController.insertAccounts(accountList);

        Account singleAccount = new Account(Name = 'Single Test');
        AccountController.insertAccount(singleAccount);
    }

    @isTest
    public static void insertAccountsTest(){
        List<Account> insertedList = [SELECT Id FROM Account WHERE Name LIKE 'Test %'];
        System.assertEquals(4, insertedList.size());
    }

    @isTest
    public static void insertSingleAccountTest(){
        List<Account> insertedSingle = [SELECT Id FROM Account WHERE Name = 'Single Test'];
        System.assertEquals(1, insertedSingle.size());
    }

    @isTest
    public static void updateAccountTest(){
        List<Account> insertedSingle = [SELECT Id FROM Account WHERE Name = 'Single Test'];
        insertedSingle[0].Description = 'Description for test';
        AccountController.updateAccount(insertedSingle[0]);
        String Description = AccountController.updateAccount(insertedSingle[0]).Description;

        system.assertEquals('Description for test',Description);
    }

    @isTest
    public static void getAllAccounts(){
        System.assertEquals(5, AccountController.getAllAccounts().size());
        System.assertEquals('Test 1', AccountController.getAllAccounts()[0].Name);
        System.assertEquals(5, AccountController.getAccountsSize());
    }
}