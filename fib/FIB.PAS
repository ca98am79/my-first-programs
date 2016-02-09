program fib(input,output);
var x:integer;
    r,exp:real;
{--------------------------FIB}
function fib(N:integer):integer;
{pre: N is a positive integer}
{post: Fib is the Nth term of the Fibonacci sequence}
begin
   if n<=2 then
      fib:=1                 {if n<=2 then it returns 1}
   else                      {it does this if n is not <=2}
      fib:=fib(N-2)+Fib(N-1);
end;
{----------------------------MAIN}
{This is the main program}
begin
 x:=1;
 writeln('TERM          R          (2R-1)squared');
 writeln('--------------------------------------');
   repeat
     writeln(fib(x),'        ',r:1:6,'        ',exp:1:6);
     x:=x+1;
     r:=fib(x)/fib(x-1);
     exp:=sqr(2*r-1);
   until (fib(x)>1000);
end.

