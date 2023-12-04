public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String LastName) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i=0;i<numContacts;i++) {
            contacts.add(
                new Contact(LastName = LastName,
                            FirstName = 'Test ' +i
            ));
        }
        system.debug(contacts);
        return contacts;
    }
}