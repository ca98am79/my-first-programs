program money(input,output);
var
   amount,
   prin,
   intrate,
   time,
   int : real;
begin
   writeln('Enter the principal.');
   readln(prin);
   writeln(prin:1:2);
   writeln('Enter the interest rate');
   readln(intrate);
   writeln(intrate:1:2);
   Writeln('Enter the number of years.');
   readln(time);
   writeln(time:1:2);
   int:=prin*intrate*time;
   amount:=prin+int;
   writeln('The interest is ',int:1:2);
   writeln('The amount is ',amount:1:2);
end.


