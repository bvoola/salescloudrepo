public with sharing class CTLocationController {
    public CTLocationController() {

    }
  
    public static List<Location__c> getRecentStatusChanges()
    {
        return [select id,name,Address__c,Pincode__c,Red_Score__c,Status__c,Status_Update_Date__c from Location__c order by Status_Update_Date__c DESC NULLS LAST LIMIT 100 ];
    }
    public static List<Location__c> searchLocations(String searchTerm)
    {
        searchTerm=searchTerm+'%';
        return [select id,name,Address__c,Pincode__c,Red_Score__c,Status__c,Status_Update_Date__c from Location__c WHERE name like :searchTerm or pincode__c like :searchTerm or address__c like :searchTerm order by Status_Update_Date__c DESC ];
    }
    
    public static Location__c getLocationById(String locationId)
    {
        List<Location__c> loc=new List<Location__c>();
        loc=[select id,name,Address__c,Pincode__c,Red_Score__c,Status__c,Status_Update_Date__c from Location__c where id=:locationId order by Status_Update_Date__c NULLS LAST ];
        if(loc!=null && loc.size()>0)
        return loc[0];
        else {
            return null;
        }
    }
    public static Map<string,Integer> getStatusCount() 
    {
        Map<string,Integer> result=new Map<string,integer>();
        for(AggregateResult ar:[select Status__c,count(id) total from Location__c GROUP BY Status__c])
        {
            result.put(String.valueOf(ar.get('Status__C')),Integer.valueOf(ar.get('total')));
        }
        return result;
    }
}