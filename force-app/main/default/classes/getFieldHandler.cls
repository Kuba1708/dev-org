public class getFieldHandler {
	public void MainMethod(List<Account> accounts, List<Case> cases){
        retreivingField getField = new retreivingField();
        List<String> AccountResult = getField.getValue(accounts,'Type');
        List<String> CaseResult = getField.getValue(cases,'ContactEmail');
        system.debug(AccountResult + '***********' + CaseResult);
    }
}