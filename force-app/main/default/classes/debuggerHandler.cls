public with sharing class debuggerHandler {
    public Account createAccount(String accountName, String accountNumber, String tickerSymbol){
        Account newAcct = new Account(
            Name = accountName,
            AccountNumber = accountNumber,
            TickerSymbol = tickerSymbol
        );
        return newAcct;
    }
}