public class PassingParameters {
    public String firstName;
    
    public void main() {
    	PassingParameters params = new PassingParameters();
        params.firstName = 'Kuba';
        params.changeName(params);
        system.debug(params.firstName);
    }
    
    private PassingParameters changeName(PassingParameters p){
        p = new PassingParameters();
        p.firstName = 'Jakub';
        system.debug(p.firstName);
        return p;
    }
}