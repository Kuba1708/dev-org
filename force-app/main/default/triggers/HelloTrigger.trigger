trigger HelloTrigger on Account (after insert, after update) {
    //     List<Opportunity> oppsToCreate = new List<Opportunity>();
    //     Map<Id, Account> AccWithOpp = new Map<Id, Account>(
    //         [SELECT Id, Name, (SELECT AccountId FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]
    //     );
    // System.debug(AccWithOpp);

    // for (Account a : Trigger.new) {
    //     if(AccWithOpp.get(a.Id).Opportunities.size() ==0) {
    //         Opportunity opp = new Opportunity(
    //             Name = a.FirstName + ' Opportunity',
    //             StageName = 'Prospecting',
    //             CloseDate=System.today().addMonths(1),
    //             AccountId = a.Id
    //         );
    //         oppsToCreate.add(opp);
    //     }
    // }
    // if (oppsToCreate.size() > 0) {
    //     insert oppsToCreate;
    // }
}