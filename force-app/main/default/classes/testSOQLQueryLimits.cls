@Istest public class testSOQLQueryLimits { 

static testmethod void doTest() { 
insert new Account(name = 'mytest'); 

Integer MAX_QUERY = Limits.getLimitQueries(); 
Integer NUM_QUERY = MAX_QUERY - 1; 

for (Integer i = 0; i < NUM_QUERY; i++) { 
Account a = [select id from account limit 1]; 
} 
System.assertEquals(NUM_QUERY, Limits.getQueries()); 

Test.startTest(); 
//System.assertEquals(0, Limits.getQueries()); 
for (Integer i = 0; i < NUM_QUERY; i++) { 
Account a = [select id from account limit 1]; 
} 
System.assertEquals(NUM_QUERY, Limits.getQueries()); 
Test.stopTest(); 

System.assertEquals(NUM_QUERY, Limits.getQueries()); 
} 
}