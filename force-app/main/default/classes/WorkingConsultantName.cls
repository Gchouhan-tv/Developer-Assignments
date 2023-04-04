public class WorkingConsultantName{
       public static list<String>  listOfEmployers(Id empId)
       {
          list<hiring__C> hiringList = [select Consultant__r.name  from  hiring__c where  Employer__r.id =:empId];
           list<String> consNameList = new List<string>(); 
           for (hiring__c hr : hiringList) {
               consNameList.add(hr.Consultant__r.name);
           }
             
           return consNameList;
       }
}