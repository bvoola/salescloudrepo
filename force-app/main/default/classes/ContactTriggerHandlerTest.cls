@isTest
public class ContactTriggerHandlerTest {

    @isTest
    public static void updateTotalActiveContactstest()
    {
        Account a=new Account(name='testacc');
        insert a;
        Contact c=new Contact(lastname='Blessy Voola', is_active__c=true,accountid=a.id);
            insert c;
       Account a1=[select id,Number_of_Active_Contacts__c from account where id=:a.id];
        system.debug(a.id + '  '+ c.id+'  '+ a1.id);
        system.assertequals(1,a1.Number_of_Active_Contacts__c,'test failed');
    }
}