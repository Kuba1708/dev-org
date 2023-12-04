public with sharing class ApexSOQL {

    private static Set<String> accountTypes = new Set<String>{'Partner','Customer','Technology Partner'};

    public static void queryForAccounts() {
        Integer minRevenue = 50000;
        List<Account> accList = [SELECT Name,Type FROM Account WHERE Type IN : accountTypes];
        // System.debug('This is my list : ' + accList);

        Map<Id, Account> accMap = new Map<Id, Account>(
            [SELECT Name FROM Account WHERE Type IN : accountTypes]);
            system.debug('This is my Map : ' + accMap.values());
            System.debug('Map without .values ' + accMap);
    }

    public static void dynamicAccountQuery(){
        String query = 'SELECT Id,Name FROM Account WHERE Type IN :accountTypes';
        System.debug(query);
        List<Account> accList = Database.query(query);
        System.debug(accList);
    }
}