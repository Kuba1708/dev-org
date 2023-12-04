public class OpportunityController {
/*    public void updateProfile(List<Id> Ids){
        List<Opportunity> opportunities = [SELECT Id, Name FROM Opportunity WHERE Id IN :Ids ];
        if(opportunities.size() < 10000){
            for(Opportunity opp : opportunities){
                opp.Profile__c = 'Low';
            }
        }else if(opportunities.size() > 10000 && opportunities.size() < 50000){
            for(Opportunity opp : opportunities){
                opp.Profile__c = 'Medium';
            }
        }else if(opportunities.size() > 50000){
            for(Opportunity opp : opportunities){
                opp.Profile__c = 'High';
            }
        }
        
        system.debug(opportunities);
        update opportunities;

    }
*/
    
    public static void updateProfile(List<Id> oppIds){
        List<Opportunity> opps  = [SELECT Id, Name, Profile__c,Amount FROM Opportunity WHERE Id IN :oppIds];
        for(Opportunity opp : opps){
            if(opp.Amount < 10000){
                opp.Profile__c = 'Low';
            }else if(opp.Amount > 10000 && opp.Amount < 50000){
                opp.Profile__c = 'Medium';
            }else if(opp.Amount > 50000){
                opp.Profile__c = 'High';
            }
        }
    }
}