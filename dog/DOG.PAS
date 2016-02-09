program dog(input,output);
var
   w,x,y,z,pts,num,amt,a,b,c:integer;
   f:char;
{-----------------------------Whichway?}
procedure whichway(var x,y:integer);
var
   c:char;
   amt:integer;
begin
   read(kbd,c);
   if c='8' then
   begin
      y:=y-1;
      gotoxy(x,y);
      plot(x,y+1,black);
      plot(x,y,white);
   end
   else if c='2' then
   begin
      y:=y+1;
      gotoxy(x,y);
      plot(x,y-1,black);
      plot(x,y,white);
   end
   else if c='4' then
   begin
      x:=x-1;
      gotoxy(x,y);
      plot(x+2,y,black);
      plot(x,y,white);
   end
   else if c='6' then
   begin
      x:=x+1;
      gotoxy(x,y);
      plot(x-2,y,black);
      plot(x,y,white);
   end
   else if c='7' then
   begin
      x:=x-1;
      y:=y-1;
      gotoxy(x,y);
      plot(x+1,y+1,black);
      plot(x,y,white);
   end
   else if c='9' then
   begin
      x:=x+1;
      y:=y-1;
      gotoxy(x,y);
      plot(x-1,y+1,black);
      plot(x,y,white);
   end
   else if c='1' then
   begin
      x:=x-1;
      y:=y+1;
      gotoxy(x,y);
      plot(x+1,y-1,black);
      plot(x,y,white);
   end
   else if c='3' then
   begin
      x:=x+1;
      y:=y+1;
      gotoxy(x,y);
      plot(x-1,y-1,black);
      plot(x,y,white);
   end;
end;
{---------------------------------MAIN}
begin
   graphcolormode;
   w:=random(639); x:=random(199);
   y:=random(639); z:=random(199);
   plot(w,x,white);
   plot(y,z,white);
   amt:=2000;
   write('POINTS:':100,pts);
   for a:=1 to 100 do
   plot(random(320),random(200),blue);
   b:=100; c:=100;
   gotoxy(100,100);
   pts:=0;
   plot(100,100,white);
   repeat
   if (b=w) and  (c=x) then
   begin
   pts:=pts+1;
   write('POINTS:':100,pts);
   end;
   if (b=y) and  (c=z) then
   begin
   pts:=pts+1;
   write('POINTS:':100,pts);
   end;
   num:=random(4)+1;
   amt:=amt-num;
   gotoxy(1,2);
   writeln('TIME:':1,amt:1,'  ');
   whichway(b,c);
   until (amt<1) or (pts=3);
   if pts=3 then writeln(' YOU WON!!!!!!!!!!!!!!');
   if amt<1 then writeln('HA HA HA YOU LOST!!!');
end.