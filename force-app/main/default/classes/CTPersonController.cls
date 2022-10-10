public with sharing class CTPersonController {
    public static string getToken(String mobileNo)
   {
       String token;
       Blob mobileblob=blob.valueOf(mobileNo);
       Blob hash=crypto.generateDigest('MD5', mobileblob);
      //token= hash.toString();
      
      token= EncodingUtil.base64Encode(hash);
        system.debug(token);
       return token;
   }
   public List<Person__c> getRecentHealthChanges()
    {
        List<Person__c> personlist=new List<Person__c>(); 
        personlist=[select id,Name,Health_Status__c,Mobile__c,Status_Update_Date__c,Token__c from Person__c ORDER BY Status_Update_Date__c desc NULLS LAST LIMIT 100];
        return personlist;


    }
    public List<Person__C> searchPeople(String st)
    {
        String searchTerm=st;
        searchTerm=searchTerm+'%';
        List<Person__c> personlist=new List<Person__c>(); 
       personlist=[select id,Name,Health_Status__c,Mobile__c,Status_Update_Date__c,Token__c from Person__c where (name like :searchTerm OR Mobile__c like :searchTerm OR Token__c like :searchTerm) ORDER BY Status_Update_Date__c desc NULLS LAST];
        return personlist;

    }
    Public Person__c getPersonById(String personId)
    {
         List<Person__c> p=new List<Person__c>();
        p=[select id,Name,Health_Status__c,Mobile__c,Status_Update_Date__c,Token__c from Person__c where id=:personId ];
        if(p!=null && p.size()>0)
        return p[0];
        else {
            return null;
        }

    }
   /* public static Map<string,Integer> getHealthStatusCount() 
    {
        AggregateResult[] healthStatusCount=[select health_status__c , COUNT(id)  countids from Person__c GROUP BY Health_Status__c];
        Integer count;
        Map<string,integer> countbystatus=new Map<String,Integer>();
        for(AggregateResult ar: healthStatusCount)
        {
            countbystatus.put(String.valueOf(ar.get('health_status__c')), Integer.valueof(ar.get('countids')));
        }
        return countbystatus;
    }*/
    //USING SOQL FOR LOOPS
    public static Map<string,Integer> getHealthStatusCount() 
    {
        Map<string,integer> countbystatus=new Map<String,Integer>();
        for(AggregateResult ar : [select health_status__c, COUNT(id) countids from Person__c GROUP BY Health_Status__c])
        {
            countbystatus.put(String.valueOf(ar.get('health_status__c')), Integer.valueof(ar.get('countids')));
        }
        return countbystatus;
    }
}