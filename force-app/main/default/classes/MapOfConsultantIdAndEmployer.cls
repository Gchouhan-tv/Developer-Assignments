public class MapOfConsultantIdAndEmployer {
    public static map<account, set<id>> mapOfEmployerAndConsultant()
    {           map<account,set<id>> employerConsultantMap= new map<account,set<id>>(); 
     //list<account> listOfEmployer = [select id , (select consultant__c from hirings__r)  from Account];
     list<account> employerList = new list<account>();
     
     for(account ac : [select id , (select consultant__c from hirings__r)  from Account])
     {
         set<id> consSet = new set<id>();
         for(hiring__c cons : ac.hirings__r)
         {  
             employerList.add(ac);
             consSet.add(cons.consultant__c);
             
         }
         employerConsultantMap.put(ac,consSet);
     }        
   
     return employerConsultantMap;
     
    }
}