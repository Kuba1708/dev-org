public with sharing class exceptionHandler {
    public void tryCatch(Integer a, Integer b) {
        try {
            	Integer dividedNumber =  a / b;       
        	} catch (Exception e) {
            	system.debug(e.getMessage());
        	}
    }
}