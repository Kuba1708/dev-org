public class AccountEmail {
    public static String getAccountEmail(Map<Id,String> employeeIdToEmail, String accountId){
        return employeeIdToEmail.get(accountId) == null ? 'info@apexsandbox.io' : employeeIdToEmail.get(accountId);
    }
}