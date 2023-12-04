trigger AccountDeletion on Account (before delete) {
    // Prevent deletion accounts with related opportunities
        for(Account a : [SELECT Id, Name FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.Old  ]) {
            Trigger.oldMap.get(a.Id).addError('Cannot delete Account with related opportunities');
            
        }
    }