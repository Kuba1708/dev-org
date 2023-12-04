@isTest
public class Covid19Test {
    @isTest
    public static void treatPatientTest(){
	 	//create the isnatce of the class
	 	Covid19 wielkopolska = new Covid19(10);
        
        // check if the count is 10 or not
        Integer treated = wielkopolska.getTreated();
        System.assertEquals(10, treated,'Expected 10');
        system.debug('******* ' + treated + ' *********');
        wielkopolska.treatPatient();
        system.assertEquals(wielkopolska.recoveredInArea,11);
        
        // check RecoveredInCountry
        Covid19 malopolska = new Covid19(100);
        
        system.assertEquals(111, Covid19.recoveredInCountry);
        
        Covid19 slask = new Covid19(10);
        slask.treatPatient();
        System.assertEquals(11,slask.recoveredInArea);
        System.assertEquals(122,Covid19.recoveredInCountry);
    }
    @isTest
    public static void treatPatientTestNegative(){
	 	//create the isnatce of the class
	 	Covid19 wielkopolska = new Covid19(-10);
        
        // check if the count is 0 or not
        Integer treated = wielkopolska.getTreated();
        System.assertEquals(0, treated,'Expected 10');
    }
        
}