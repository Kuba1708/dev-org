public class University {
	String nameUniversity;
    Integer countStudents;
    Integer foundationDate;
    
    private class department {
        public String departmentName;
        public Integer departmentStudents;
        public void printDepartment(){
            system.debug(departmentName);
        }
    } 
}