program music;
var m,i,j,x,y:integer;
   jed:char;
begin
   clrscr;
   textcolor(7);
   writeln('does not support MUSIC.COM');
   writeln;
   for x:=1 to 10000 do;
   for x:=1 to 10000 do;
   for x:=1 to 10000 do;
   for x:=1 to 10000 do;
   clrscr;
   textcolor(20);
   writeln;
   writeln('SYSTEM OVERLOAD                  SYSTEM OVERLOAD');
   writeln;
   textcolor(7);
   writeln('Memory check:');
   for i:=1 to 103 do
   begin
   gotoxy(1,5);
   write(i:1,' k memory');
   end;
   writeln;
   for y:=1 to 30000 do
   sound(4000);
   textcolor(20);
   writeln;
   writeln('AUDIO DAMAGE');
   delay(500);
   x:=0;
   repeat
   repeat
   x:=x+1;
   i:=random(10000);
   j:=random(10000);
   sound(i);
   sound(j);
   until keypressed;
   read(kbd,jed);
   until jed='q';
   nosound;
end.
