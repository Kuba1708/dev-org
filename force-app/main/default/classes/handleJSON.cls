public class handleJSON {
public static AccountJSON getAccountsFromJSONString(String inputJSON){
    // if(inputJSON == null){
    //     return null;
    // }
    // List<Account> result =(List<Account>)JSON.deserialize(inputJSON,List<Account>.class);
    // return result;
    AccountJSON accJSON = (AccountJSON) System.JSON.deserialize(inputJSON,AccountJSON.class);
    system.debug(accJSON);
    return accJSON;

}
public class AccountJSON {
    public String Type;
    public String url;
    public Id id;
    public String Name;
}
}