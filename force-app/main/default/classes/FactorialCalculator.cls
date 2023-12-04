public class FactorialCalculator {
    public static Integer recursiveCalculator(Integer numberToCheck){
        Integer factorialResult = 1;
        if(numberToCheck == 0){
            return 1;
        }
        for(integer i = 1; i <= numberToCheck;i++){
            factorialResult *= i;
        }
        system.debug(factorialResult);
        return factorialResult;
    }
}