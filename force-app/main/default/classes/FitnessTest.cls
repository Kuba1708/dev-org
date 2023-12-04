@isTest
public class FitnessTest {
	
    @isTest
    public static void calculateBMITest(){
        System.assertEquals(26.06,Fitness.calculateBMI(78,1.73),'');
    }
    
    @isTest 
    public static void calculateBMINegative(){
        System.assertEquals(0.00,Fitness.calculateBMI(0, 120));
        System.assertEquals(0.00,Fitness.calculateBMI(0, 0));
        System.assertEquals(0.00,Fitness.calculateBMI(10, 0));
        
    }
    
    @isTest
    public static void calculatePaceTest(){
        System.assertEquals(20.00,Fitness.calculatePace(50,150));
    }
    
    @isTest
    public static void calculatePaceNegativeTest(){
     	System.assertEquals(0,Fitness.calculatePace(120,0));   
    }
}