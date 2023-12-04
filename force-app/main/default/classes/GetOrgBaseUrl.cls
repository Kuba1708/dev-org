global class GetOrgBaseUrl {
    @InvocableMethod(Label ='Get Salesfroce base and record URL')
    global static List<Results> getBaseUrl(List<sObject> UrlRecords) {
        List<Results> sfdcURLs = new List<Results>();
        for(sObject obj:UrlRecords) {
            Results r = new Results();
            
            r.sfdcBaseURL=URL.getSalesforceBaseUrl().toExternalForm();
            r.sfdcRecordURL = URL.getSalesforceBaseUrl().toExternalForm()+'/'+obj.id;
            
            sfdcURLs.add(r);
        }
        return sfdcURLs;
    }
    global class Results{
        
        @InvocableVariable
        global String sfdcBaseURL;
        
        @InvocableVariable
        global String sfdcRecordURL;
    }
}