public class helloworld
{
private string greeting='hello world';
public string publicgreeting='public greeting';
public void printgreeting(string text)
{
//String greeting=text;
system.debug(text);
}
public string getday(integer i)
{
string daystring;
switch on i{
when 1{
daystring = 'sunday';
}
}
return daystring;
}

public string getday(integer i,integer j)
{
return '';
}
/*global void printpublicgreeting()
{
system.debug(publicgreeting);

}*/
}