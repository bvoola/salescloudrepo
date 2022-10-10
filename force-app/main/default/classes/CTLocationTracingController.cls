public with sharing class CTLocationTracingController {
    public CTLocationTracingController() {

    }
    public static List<Location_Tracing__c> getVisitors(String locationId)
    {
       // List<Location_Tracing__c> locations=new List<Location_Tracing__c>();
       return [select id,name,Location__c,Person__c,Visit_Date__c from Location_Tracing__c where Location__c= :locationId ORDER BY Visit_Date__c DESC NULLS LAST];
    }
    public static List<Location_Tracing__c> getLocationsByPersonIds(Set<id> personIds)
    {
       // List<Location_Tracing__c> locations=new List<Location_Tracing__c>();
       return [select id,name,Location__c,Person__c,Visit_Date__c from Location_Tracing__c where Person__c IN  :personIds and Visit_Date__c = LAST_N_DAYS:10];

    }
    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<id> locationIds) 
    {
        return [select id,name,Location__c,Person__c,Visit_Date__c from Location_Tracing__c where Location__c IN  :locationIds and person__r.Health_Status__c='Green' and Visit_Date__c = LAST_N_DAYS:10];
 
    }
     public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> locationTraces)
    {
        set<id> personids=new set<id>();
        set<id> locationids=new set<id>();
        List<Location_Tracing__c> duplicates=new List<Location_Tracing__c>();
        Map<id,Set<Id>> checkduplicates=new Map<id,Set<Id>>();
        for (Location_Tracing__c var : locationTraces) {
            personids.add(var.person__c);
            locationids.add(var.location__c);
        }

        List<Location_Tracing__c> queryLocationTraces=[select id,Person__c,Location__c from Location_Tracing__c where person__C IN :personids and location__c IN :locationids];
        for (Location_Tracing__c var : queryLocationTraces) 
        {
            if (!checkduplicates.containsKey(var.location__c)) {
                checkduplicates.put(var.Location__c,new set<id>());
            }   
            checkduplicates.get(var.Location__c).add(var.Person__c);         
        }
        for(Location_Tracing__c dup: locationTraces)
        {
            if(checkduplicates.containsKey(dup.Location__c) && checkduplicates.get(dup.Location__c).contains(dup.Person__c))
                duplicates.add(dup);
        }
        
        return duplicates;
    }
    
}