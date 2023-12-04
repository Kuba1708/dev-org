trigger TestTrigger on Account (after update) {
    List<Account> acctWithOpps = [SELECT Id,Name,(SELECT Id,Name FROM Opportunities) FROM Account WHERE Id IN :Trigger.New];
    System.debug(acctWithOpps);
}