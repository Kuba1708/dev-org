@isTest
public with sharing class TestRestrictContactByName {
    @isTest public static void TestInvalidName() {
        Contact con = new Contact(
            FirstName = 'Test',
            LastName = 'INVALIDNAME'
        );

        Database.SaveResult result = Database.insert(con,false);
        System.assertEquals('The Last Name "'+con.LastName+'" is not allowed for DML' ,result.getErrors()[0].getMessage());
    }

    @isTest public static void TestCorrectName() {
        Contact con = new Contact(
            FirstName = 'Johnny',
            LastName = 'Smith'
        );

        Database.saveResult result = Database.insert(con,false);
        System.assert(result.isSuccess());
    }

}