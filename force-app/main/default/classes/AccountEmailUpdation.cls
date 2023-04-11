public with sharing class AccountEmailUpdation {
    public static void PrimaryAccountEmailUpdation(list<Contact> listOfNewContact)
    {    Set<Account> setOfPrimaryAccountId = new Set<Account>(); 

        list<Account> listOfContactWithPrimaryAccount = [select Id , Email__c,(select Id, Is_Primary__c,Email from Contacts) from Account];
        Set<ID>  primaryAccountIdSet = new Set<ID>();
        List<Account> updatedAccountList = new List<Account>();
        for(Account acList : listOfContactWithPrimaryAccount)
        {
            for(Contact Con : acList.Contacts )
            {
                if(Con.Is_Primary__c)
                {
                    acList.Email__c = Con.Email;
                    updatedAccountList.add(acList);
               
                }
            }
        }

        update updatedAccountList;

        
      
    }
}