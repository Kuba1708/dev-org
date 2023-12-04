public class fitnessClass {
	private Decimal BMI = 0;
    private Decimal pace = 0;
    
    public Decimal calculateBMI (Decimal weight, Decimal height){
        BMI = weight / (height * height);
        BMI = BMI.setScale(2);
        system.debug('BMI: ' + BMI);
        return BMI;
    }
    
    public Decimal calculatePace (Decimal distance, Decimal timeInMinute){
        pace = distance / timeInMinute;
        system.debug('Pace: ' + pace);
        return pace;
    }
}