public class Reservation {
	Boolean booked;
    
    
    public void makeReservation() {
        booked = true;
        system.debug(booked);
    }
    
    public void cancelReservation() {
        booked = false;
        system.debug(booked);
    }
}