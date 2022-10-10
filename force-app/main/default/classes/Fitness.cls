/*fitness class
calculate bmi method
body weight in kg/body height in mter2
calculatepace
distanceinkm/timeinminuts
return in km/hr*/

public class Fitness
{
public decimal calculatebmi(decimal weight,decimal height)
{
decimal bmi;
bmi=weight/(height*height);
return bmi;
}
public decimal calculatepace(decimal km,decimal min)
{
decimal pacekmpermin,pacekmperhr;
pacekmpermin=km/min;
pacekmperhr=pacekmpermin*60;
return pacekmperhr;
}

}