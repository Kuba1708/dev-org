public class Contract {

    Integer activatedYear; 

    public Contract(Integer activatedYear){
        this.activatedYear = activatedYear;
        system.debug(activatedYear);
    }

    public Integer calculateContractAge(){
        Integer currentYear = 2023;
        Integer contractLength = currentYear - activatedYear;
        system.debug(contractLength);
        return contractLength;
    }

}