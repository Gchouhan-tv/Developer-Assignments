public class CountOfWorkingDays {
    public static Integer NumberOfWorkingDays(Date startDate , Date endDate )
    {      
        Integer numberOfDays = 0;
        while(startDate < endDate)
        {     DateTime sDate = DateTime.newInstance(startDate.year(),startDate.month(), startDate.day());
            if(sDate.format('EEEE') != 'Saturday' || sDate.format('EEEE') != 'Sunday' )
                numberOfDays++;
            startDate = startDate.addDays(1);
        }
        numberOfDays = numberOfDays-1;
        system.debug(numberOfDays);
        return numberOfDays;
        
    }
    
}