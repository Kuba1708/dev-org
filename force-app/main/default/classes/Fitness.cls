public class Fitness {
    public static Decimal calculateBMI(Decimal bodyMass, Decimal bodyHeight) {
        if(bodyHeight <= 0 || bodyHeight <= 0){
            return 0;
        }
        Decimal BMI = bodyMass / (bodyHeight*bodyHeight) ;
        BMI = BMI.setScale(2);
        return BMI;
    }
    
    public static Decimal calculatePace(Decimal distance, Decimal minutes) {
        if(minutes <= 0 || distance <= 0){
            return 0;
        }
        Decimal hr = minutes/60;
        Decimal Pace = distance / hr;
        Pace = Pace.setScale(2);
        return Pace;
    }
}