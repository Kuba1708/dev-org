@isTest
public class DuplicateHandlerTest {
    
    @isTest
    public static void handleNoDuplicate(){
        List<Integer> noDuplicateList = new List<Integer>{1,2,3,4};
        System.assertEquals(false, DuplicateHandler.handleDuplicateInteger(noDuplicateList));
    }
    
    @isTest
    public static void handleDuplicate(){
        List<Integer> duplicateList = new List<Integer>{1,2,1,3,4};
        System.assertEquals(true, DuplicateHandler.handleDuplicateInteger(duplicateList));
    }
}