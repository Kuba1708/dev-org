public class Friends {
	Integer ONLY_ONE_SLICE = 8;
    Integer UPTO_THREE_SLICES = 7;
    Integer MORE_THAN_THREE_SLICES = 6;
    
    public Integer getBill(Integer numberOfSlices) {
    Integer billAmount = numberOfSlices == 1 ? ONLY_ONE_SLICE * numberOfSlices : 
        (numberOfSlices <= 3 ? UPTO_THREE_SLICES * numberOfSlices : 
        MORE_THAN_THREE_SLICES*numberOfSlices);
        
	 return billAmount ;
    }
}