program time(input,output,infile,outfile);
type persontype=record
       name:string[30];
       lev:integer;
      end;
var x,lev,z:real;
    push:char;
{--------------------}
{ bestscr.dat}
{--------------------}
procedure instructions;
var butt:char;
begin
   writeln('This stupid game tests your eye-hand coordination.');
   writeln('You try to stop the moving horizontal line as close to vertical line as         possible.');
   writeln('You can be off by less than 25 without losing (the red lines).');
   writeln('You try to get to the highest level you can - there''s a top 25 list when you    finish.');
   writeln;
   writeln('Bye');
   read(kbd,butt);
end;
{---------------------}
begin
 clrscr;
 instructions;
 clrscr;
 x:=0; lev:=0; z:=0;
 graphcolormode;
 graphbackground(1);
 palette(2);
 draw(175,50,175,75,2);
 draw(225,50,225,75,2);
 draw(175,50,225,50,2);
 draw(175,125,175,150,2);
 draw(225,125,225,150,2);
 draw(175,150,225,150,2);
 repeat
   x:=0;
   lev:=lev+0.01;
   gotoxy(1,1);
   write('LEVEL:',lev*100:1:0);
   draw(200,75,200,125,white);
   read(kbd,push);
   while not keypressed do
   begin
      x:=x+lev;
      draw(round(x)+20-round(lev),100,round(x)+20,100,white);
   end;
   gotoxy(1,2);
   write('You were off by ',abs(180-x):2:2);
   read(kbd,push);
   draw(20,100,round(x)+20,100,0);
   gotoxy(1,2);
   write('                           ');
until (abs(180-x))>25;
   textmode;
  { names(round(lev*10)); }
end.
