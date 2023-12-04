@isTest
public class GetOrgBaseUrlTest {

    @testSetup
    static void setup() {
        // Create a test account 
        Account a = new Account (Name='Test Account');
        insert a;
    }
    
    @isTest
    static void stripHTMLTags(){
        
        //Access the opportunity that was just created
        Account account = [SELECT Id, Name FROM Account Limit1];
        
        GetOrgBaseUrl.getBaseUrl(new List<sObject>{account});
    }
}