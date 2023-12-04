public class retreiveIDs {
    public void passMethod(List<Account> accounts){
        Set<Id>AccountIDs = getIds(accounts);
        system.debug(AccountIDs);
    }
    
    public Set<Id> getIds(List<SObject> objects){
        Set<Id> objectIds = new Set<Id>();
        for( sObject obj : objects){
            objectIds.add(obj.Id);
        }
        system.debug(objectIds);
        
        return objectIds;
    }
    
   

}