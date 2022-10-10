public with sharing class CTPeopleTracingController {
    public CTPeopleTracingController() {

    }
    public static List<people_tracing__c> getTraces(String personId) 
    {
        return [select id,name,Contact_Date__c,contact_type__c,Person_1__c,person_1__r.health_status__C, person_1__r.token__c,Person_2__c,person_2__r.health_status__C, person_2__r.token__c from People_Tracing__c where Person_1__c =:personId or person_2__C =:personId order by Contact_Date__c desc NULLS LAST];        
    }
    public static List<people_tracing__c> checkDuplicates(List<People_Tracing__c> peopletraces)
    {

        set<id> personids=new set<id>();
        for(people_tracing__c var: peopletraces)
        {
            personids.add(var.Person_1__c);
            personids.add(var.Person_2__c);
        }
        List<People_Tracing__c> ppltracelist=new List<People_Tracing__c>();
        List<People_Tracing__c> returnlist=new List<People_Tracing__c>();

        ppltracelist=[select id,name,person_1__c,person_2__c from People_Tracing__c where Person_1__c in :personids or person_2__c in :personids];
        for(People_Tracing__c var1: peopletraces)
        {
            for(People_Tracing__c var2: ppltracelist)
            if((var2.person_1__c == var1.Person_1__c || var2.person_1__c == var1.Person_2__c ) && (var2.person_2__c == var1.Person_1__c || var2.person_2__c == var1.Person_2__c ) )
            returnlist.add(var1);
        }
        return returnlist;
    }
}