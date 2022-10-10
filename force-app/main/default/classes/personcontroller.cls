public class personcontroller {
List<person__c> persons= [select id,name,health_status__c,mobile__c from person__c];
public List<Person__C> getpersons()
{
   
    return persons;
}
public void save(){}

}