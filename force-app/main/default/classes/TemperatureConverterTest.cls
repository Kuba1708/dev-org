@isTest
public with sharing class TemperatureConverterTest {
    @isTest static void FhToCsTest() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
        System.assertEquals(21.11, celsius);
    }

    @isTest static void ZeroToCs() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(100);
        System.assertEquals(37.78, celsius);
    }

    
    @isTest static void CsToFhTest() {
        Decimal fh = TemperatureConverter.CelsiusToFahrenheit(1);
        System.assertEquals(33.8, fh);
    }
}