@isTest
public class PersonControllerTest
{

@isTest(SeeAllData=true)
public static void updateAccounts()
{
Test.StartTest();
 Account acc=[select name from account where name='blessings'];
 system.assertequals('blessings',acc.name,'account fetched');
 acc.phone='12345';
 update acc;
 system.debug(acc.name + acc.phone);
 system.assertequals('12345',acc.phone,'account updated');
 Test.StopTest();
}


@isTest
public static void insertaccounts()
{
List<Account> acclist=Test.LoadData(Account.sobjecttype,'AccountsTestData');
system.debug(acclist.size());
}
}