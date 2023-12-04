@isTest
public with sharing class TestVerifyDate {
    @isTest public static void TestDateWithin30Days() {
        Date d = VerifyDate.CheckDates(System.today(), System.today().addDays(10));
        System.assertEquals(System.today().addDays(10),d);

    }

    @isTest public static void TestDateMore30Days() {
        Date d = VerifyDate.CheckDates(Date.newInstance(2020, 01, 01),Date.newInstance(2020, 03, 01));
        System.assertEquals(Date.newInstance(2020, 01, 31),d );
    }
}