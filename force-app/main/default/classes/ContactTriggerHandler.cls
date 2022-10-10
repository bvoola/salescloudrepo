public class ContactTriggerHandler {

   public static void updateTotalActiveContacts(List<contact> contacts)
   {
       Map<id,Account> accountMap;
	 //  accountMap=select id,Number_of_Active_Contacts__c from account where id =:contacts.accountid
	   // Map<id,integer> accActivecontacts=new Map<id,Integer>();
	   List<Account> acclisttoupdate=new List<Account>();
		List<id> accid= new List<id>();
       for(Contact c: contacts)
       {
           accid.add(c.accountid);
       }
       accountMap=new Map<id,Account>([select id, (select id from contacts where is_active__C=true) from account where id in :accid]);
     	 //  Account Accounttoupdate =new Account();
       for(Account a: accountMap.values()){
           Account Accounttoupdate =new Account();
        accounttoupdate.id=a.id;
       accounttoupdate.Number_of_Active_Contacts__c=a.contacts.size();
       acclisttoupdate.add(accounttoupdate);
          //  accActivecontacts.put(a.id,a.contacts.size());
       }
       update acclisttoupdate;
      
   }
}