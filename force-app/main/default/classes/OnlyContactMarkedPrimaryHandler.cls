public class OnlyContactMarkedPrimary {
  // first question of exercise 5
  public  static void afterInsert(List<Contact> listOfNewContact ,map<id , contact>oldMapOfcontacts)
  {
      
      Set<Id> accountIdSet = new Set<Id>();
      Map<Id, Id> contactIdToAccountIdMap = new Map<Id, Id>();
      for (Contact contact : listOfNewContact) {
          if (contact.Is_Primary__c && contact.AccountId != null) {
              accountIdSet.add(contact.AccountId);
              contactIdToAccountIdMap.put(contact.Id, contact.AccountId);
          }
      }
      
      
      List<Account> accountList = [Select Id, Email__C ,(Select Id, Email,Is_Primary__c from Contacts) from Account where Id in :accountIdSet];
      List<Contact> updatedContactList = new List<Contact>();
      
      for (Account account : accountList) {
          for (Contact contact : account.Contacts) {
              //System.debug(contact);
              if (contact.Is_Primary__c) {
                  if (!contactIdToAccountIdMap.containsKey(contact.Id)) {
                    contact.Is_Primary__c = false;
                    updatedContactList.add(contact);

                  }
              }
          }
      }
      update updatedContactList;
  }
}


// second Question
