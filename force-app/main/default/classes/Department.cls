public class Department {
	public String name = 'General Department';
    public Integer stuffCount = 0;
    
    public Department(String departmentName, Integer stuffCount){
        this.name = departmentName;
        this.stuffCount = stuffCount;
        system.debug(name + stuffCount);
    }
}