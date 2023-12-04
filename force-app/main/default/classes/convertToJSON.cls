public class convertToJSON {
    public static void converterMethod(List<Account> accounts){
        String JSON = System.JSON.serialize(accounts);
        system.debug(JSON);
        
    }
}