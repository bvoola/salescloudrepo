public class PersonTriggerHandler {

   public static void checkPersonStatusGreen(List<Person__c> personlist)
   {
       for(Person__c p:personlist)
       {
           if(p.Health_Status__c !='Green')
       p.adderror('Health Status should be green');

       }
}
    public static void statusupdateddate(Map<id,Person__c> oldpmap,Map<id,Person__c> newpmap){
        List<Person__c> plisttoupdate=new List<Person__c>();
        for(Person__c p:newpmap.values())
        {
            if(p.Health_Status__c!=oldpmap.get(p.id).Health_Status__c)
            {
            p.Status_Update_Date__c =system.today();
        	plisttoupdate.add(p);
            }
    }
        
}
}