public with sharing class TemperatureConverter {
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
    public static Decimal CelsiusToFahrenheit(Decimal cs) {
        Decimal fh = cs * 1.8 + 32;
        return fh.setScale(2);
    }

    
}