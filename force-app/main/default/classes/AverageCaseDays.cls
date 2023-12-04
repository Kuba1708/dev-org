public with sharing class AverageCaseDays {
    public static void updateAvgCaseResolutionDays(List<Id> accIds){

        // final map will be used to update Accounts with specified Id and avg number days
        Map<Id,Integer> finalMap = calculateDaysAndCases(accIds);
        updateAccounts(finalMap);
    }

    public static Map<Id,Integer> calculateDaysAndCases(List<Id> accIds){

        // variables to hold total cases per account and total days needed for close case per account
        Integer totalCases = 0, totalDaysToClose = 0;

        List<Case> allCases = [SELECT Id, CaseNumber,Status, AccountId, CreatedDate, ClosedDate FROM Case WHERE AccountId IN :accIds];

        // map with accId to total cases 
        Map<Id,Integer> accIdToCasesMap = new Map<Id,Integer>();
        
        // map with accId to total days cases have been opened
        Map<Id,Integer> accIdToTotalDaysMap = new Map<Id,Integer>();

        // for each case, add to map sum cases and for another map sum of days  
        for (Case cs : allCases) {
            if (cs.Status == 'Closed') {
                if(accIdToCasesMap.containsKey(cs.AccountId)){
                    accIdToCasesMap.put(cs.AccountId,accIdToCasesMap.get(cs.AccountId) + 1);
                }else{
                    accIdToCasesMap.put(cs.AccountId,1);
                }
    
                if(accIdToTotalDaysMap.containsKey(cs.AccountId)){
                    accIdToTotalDaysMap.put(cs.AccountId,accIdToTotalDaysMap.get(cs.AccountId) + cs.CreatedDate.date().daysBetween(cs.ClosedDate.date()));
                }else{
                    accIdToTotalDaysMap.put(cs.AccountId, cs.CreatedDate.date().daysBetween(cs.ClosedDate.date()));
                }
            }    
        }
        Map<Id, Integer> finalMap = new Map<Id, Integer>();
        if (!accIdToCasesMap.isEmpty()) {
            for (Id key : accIdToCasesMap.keySet()) {
                totalCases = accIdToCasesMap.get(key);
                if(accIdToTotalDaysMap.get(key) != null){
                    totalDaysToClose = accIdToTotalDaysMap.get(key);
                }
                finalMap.put(key,totalDaysToClose / totalCases);
            }
        }       
        return finalMap;
    }
    
    public static void updateAccounts(Map<Id,Integer> finalMap){
        List<Account> accountsToUpdate = new List<Account>();
        for(Id key : finalMap.keySet()){
            Account accToUpdate = new Account(
                Id = key,
                Avg_Case_Resolution_Days__c = finalMap.get(key)
            );
            accountsToUpdate.add(accToUpdate);
        }
        update accountsToUpdate;
    }
}