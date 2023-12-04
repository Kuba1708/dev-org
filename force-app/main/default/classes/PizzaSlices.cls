public class PizzaSlices {
	final Integer ONLY_ONE_SLICE = 8;
    final Integer UPTO_THREE_SLICES = 7;
    final Integer MORE_THAN_FOUR_SLICES = 6;
    Integer toPay = 0;
    
    public Integer calculateBill(Integer numberOfSlices){
        
        toPay = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices :
                numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices :
        		numberOfSlices > 4 ? MORE_THAN_FOUR_SLICES*numberOfSlices :
        		0;
        system.debug('The bill is: ' + toPay);
        return toPay;
        
        /*
    	numberOfSlices = rossOrder;
    	Integer rossHasToPay = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices : numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices : MORE_THAN_FOUR_SLICES*numberOfSlices;
    	System.debug('Ross has to pay: ' +rossHasToPay);    
        
        
        numberOfSlices = chandlerOrder;
    	Integer chandlerHasToPay = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices : numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices : MORE_THAN_FOUR_SLICES*numberOfSlices;
    	System.debug('Chandler has to pay: ' +chandlerHasToPay); 
        
        numberOfSlices = joeyOrder;
    	Integer joeyHasToPay = numberOfSlices == 1 ? ONLY_ONE_SLICE*numberOfSlices : numberOfSlices <= 3 ? UPTO_THREE_SLICES*numberOfSlices : MORE_THAN_FOUR_SLICES*numberOfSlices;
    	System.debug('Joey has to pay: ' +joeyHasToPay); 
		*/
	
    }
    
}