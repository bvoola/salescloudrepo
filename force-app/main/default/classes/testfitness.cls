@istest
public class testfitness

{
@istest
public static void testcalculatebmi()
{
Fitness f=new Fitness();
Decimal d=f.calculatebmi(45,5);
system.assertequals(d,1.8,'theres a problem');
}
@istest
public static void testcalculatepace()
{
Fitness f=new Fitness();
Decimal d=f.calculatepace(100,10);
system.assertequals(d,600,'theres a problem');
}
}