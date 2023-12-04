public class CreatingAccounts {
    public static void InserMethod() {
        List<Account> accts = new List<Account>();
        for(Integer i =0;i<50;i++) {
            Account record = new Account ();
            record.Name = 'Test' + i;
            record.Type__c = 'DE';
            accts.add(record);
        }
        insert accts;
    }
    
}