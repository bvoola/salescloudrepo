//changes to pull from remote to vscode
//pushing changes in vs code to git lab and git hub
public class AccountController {

    public static void updateAvgCaseResolutionDays(List<Id> accountIds){
        
    
        List<account> accountstoupdate=new List<Account>();
          Integer totalDays = 0, totalCases = 0;
  
        List<account> accounts=[select id, (SELECT Id, CreatedDate, ClosedDate
                             FROM Cases
                             WHERE IsClosed=true) from account
                            	where id IN :accountIds ];
     For(account a:accounts)
     {
         for(Case c:a.cases)
         {
         totalDays += c.CreatedDate.date().daysBetween(c.ClosedDate.date());
         totalCases++;
             system.debug('total cases'+ totalcases+'totaldays'+totaldays);
         }
         Decimal resolutionDays = totalDays/totalCases;
         system.debug('resolutiondays'+resolutiondays);
         a.Avg_Case_Resolution_Days__c = resolutionDays;
         Accountstoupdate.add(a);
     }
        update accountstoupdate;
      system.debug('accountsupdated'+accountstoupdate);
       }
}    
        
        
        
      //  for(Case c: cases)
      //  {
          // totalDays += c.CreatedDate.date().daysBetween(c.ClosedDate.date()); 
      //  }
        //  totalCases=totalCases+cases.size();
                // retrive all the cases for this account
        // get resolution days for each account (ClosedDate - CreatedDate)
        //Integer totalDays = 0, totalCases = 0;
        /*for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate
                             FROM Case
                             WHERE IsClosed=true
                            	AND AccountId =: accountId]){
            // increase number of cases
            totalCases++;
            // get duration in days and add it to totalDays
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
        }
        Decimal resolutionDays = totalDays/totalCases;
        // update account object
        Account acc = new Account(Id=accountId, Avg_Case_Resolution_Days__c = resolutionDays);
        update acc;
    }*/
