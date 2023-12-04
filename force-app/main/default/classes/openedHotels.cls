public class openedHotels {
	private Integer openedInPoland = 0;
    public static Integer openedTotal = 0;
    
    
    public void openHotel(){
        this.openedInPoland ++;
        openedTotal ++;
        System.debug('Opened in Poland ' + openedInPoland);
    }
    
    public static void prsntTotal(){
        System.debug('Opened hotels in total: ' + openedTotal);
        
    }
}