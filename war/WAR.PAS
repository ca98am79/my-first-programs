program stuff(output);
const
   J=11;
   Q=12;
   K=13;
   A=14;
var
   crdsuit:integer;
   crdnum:integer;
   crdsuit2,
   crdnum2:integer;
   points2,
   points:integer;
   z:char;
{------------------------------------ PRINT CARD}
procedure printcard(crdsuit,
                    crdnum:integer);
begin
   if (crdnum>=2) and (crdnum<=10) then
      writeln(crdnum:1,chr(crdsuit):1)
   else if crdnum=J then
      writeln('J':1,chr(crdsuit):1)
   else if crdnum=Q then
      writeln('Q':1,chr(crdsuit):1)
   else if crdnum=K then
      writeln('K':1,chr(crdsuit):1)
   else
      writeln('A':1,chr(crdsuit):1)
end; {printcard}
{------------------------------------- WHO WINS?}
procedure whowins(x,y,p,p2:integer);
begin
   if x>y then
      begin
         writeln('you win...');
         points:=points+1;
      end
   else if x<y then
      begin
         writeln('I WIN!!!!');
         points2:=points2+1;
      end
   else
      writeln('Draw');
      writeln;
      writeln('ME-',points2:1,'     YOU-',points:1);
end; {whowins?}
{------------------------------------- MAIN}
begin
   points:=0;
   points2:=0;
   writeln('This is the game of WAR!!');
   writeln('We play until one of us gets 10 pts.');
   while (points<10) and (points2<10) do
      begin
         writeln('Here is your card.');
         crdnum:=random(12)+2;
         crdsuit:=random(3)+3;
         printcard(crdsuit,crdnum);
         writeln;
         writeln('Here is my card');
         crdnum2:=random(12)+2;
         crdsuit2:=random(4)+3;
         printcard(crdsuit2,crdnum2);
         whowins(crdnum,crdnum2,points,points2);
         if points=10 then
            writeln('you won the game... congratulations...')
         else if points2=10 then
            writeln('I WON THE GAME!!!!! YIPEEEEE!!!');
         writeln('Press <ENTER> to go on.');
            readln(z);
      end;
end.




