public class AccountController {
    public static List<Account> insertAccounts(List<Account> accountsToInsert){
        insert accountsToInsert;
        return accountsToInsert;
    }


    public static Account insertAccount(Account accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }  
    
    public static Account updateAccount(Account accountToUpdate){
        update accountToUpdate;
        return accountToUpdate;
    }
    
    public static List<Account> getAllAccounts(){
         List<Account> accounts = [SELECT Name, Phone FROM Account];
        return accounts;
    }
        
    public static Integer getAccountsSize(){
        List<Account> accounts = getAllAccounts();
        return accounts.size();
    }
}