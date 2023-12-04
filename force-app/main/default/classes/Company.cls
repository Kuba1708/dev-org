/*
 Company Class, stores information about the company and its customers
*/
public class Company {
    public String companyName; 
    public String ceo;
    public Integer employeeCount;
    public Long revenue;
	
    // List of all customers
    private List<Client> customers = new List<Client>();
    
    public void printCompanyData(){
        system.debug('Company: ' + companyName + ', Ceo: ' + ceo + ', Employee Count: ' + employeeCount + ', revenue: ' +revenue);
        
    }
    
    public void addNewCustomer(String clientName, String website, String email, Long phone){
        Client customer = new Client(clientName,website,email,phone);
        customers.add(customer);
    }
    
    public void getAllCustomers(){
        // print all customers
        for(Client customer : customers){
            System.debug('Client name: ' + customer.clientName);
            System.debug('Client website: ' + customer.website);
            System.debug('Client email: ' + customer.email);
            System.debug('Client phone: ' + customer.phone);
        }
    }
    
    // private inner class to store the customer information
    private class Client{
        public String clientName;
        public String website;
        public String email;
        public Long phone;
        
        Client (String clientName, String website, String email, Long phone){
            this.clientName = clientName;
            this.website = website;
            this.email = email;
            this.phone = phone;
        }
    }
}