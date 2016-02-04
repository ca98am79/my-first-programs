program nothing(input,output);
var c,x,y,w,z:integer;
   g:char;
   a,b:real;
{=========}
procedure circle(x,y,c:integer);
begin
   plot(x+10,y,c);
   plot(x-10,y,c);
   plot(x,y+5,c);
   plot(x,y-5,c);
   plot(x+5,y+2,c);
   plot(x-5,y+2,c);
   plot(x+5,y-2,c);
   plot(x-5,y-2,c);
end;
{===========}
begin
   x:=30;
   y:=10;
   hires;
   for z:=1 to 19 do
   for w:=1 to 21 do
      circle(w*x,z*y,1);
   for z:=5 to 15 do
   for w:=5 to 21 do
      circle(w*x,z*y,0);
   for z:=5 to 15 do
   for w:=5 to 22 do
   begin
      if w<16 then
      a:=(w-5)*3
      else a:=33;
      if (w>10) and (z>12) then a:=a-1;
      if (z=10) and ((w>9) and (w<12)) then a:=a-3*(w-9)
      else if (z=10) and (w>11) then a:=a-9;
      if (w>10) and ((z=9) or (z=11)) then a:=a-3;
      c:=trunc(a);
      circle(w*x-c,z*y,1);
   end;
   for z:=9 downto 1 do
   begin
   if z>5 then a:=abs(5-z)*3
   else a:=0;
   c:=trunc(a);
   plot(z*x-c+10,9*y,0);
   plot(z*x-c+7,9*y,1);
   plot(z*x-c+5,9*y+2,0);
   plot(z*x-c+2,9*y+2,1);
   plot(z*x-c-3,9*y+5,1);
   plot(z*x-c+5,9*y-2,0);
   plot(z*x-c+2,9*y-2,1);
   plot(z*x-c-5,9*y+2,0);
   plot(z*x-c-8,9*y+2,1);
   end;
   for z:=9 downto 1 do
   begin
   if z>5 then a:=abs(5-z)*3
   else a:=0;
   c:=trunc(a);
   plot(z*x-c+10,11*y,0);
   plot(z*x-c+7,11*y,1);
   plot(z*x-c+5,11*y+2,0);
   plot(z*x-c+2,11*y+2,1);
   plot(z*x-c-3,11*y-5,1);
   plot(z*x-c+5,11*y-2,0);
   plot(z*x-c+2,11*y-2,1);
   plot(z*x-c+5,11*y-2,0);
   plot(z*x-c+2,11*y-2,1);
   plot(z*x-c-5,11*y-2,0);
   plot(z*x-c-8,11*y-2,1);
   end;
   for z:=12 to 22 do
   begin
   if z<16 then
     a:=(z-5)*3-3
   else
     a:=30;
   c:=trunc(a);
   plot(z*x-c-10,9*y,0);
   plot(z*x-c-7,9*y,1);
   plot(z*x-c-5,9*y+2,0);
   plot(z*x-c-2,9*y+2,1);
   plot(z*x-c,9*y+5,0);
   plot(z*x-c+3,9*y+5,1);
   plot(z*x-c-5,9*y-2,0);
   plot(z*x-c-2,9*y-2,1);
   plot(z*x-c+5,9*y+2,0);
   plot(z*x-c+8,9*y+2,1);
   end;
   for z:=12 to 22 do
   begin
   if z<16 then
     a:=(z-5)*3-3
   else
     a:=30;
   c:=trunc(a);
   plot(z*x-c-10,11*y,0);
   plot(z*x-c-7,11*y,1);
   plot(z*x-c-5,11*y+2,0);
   plot(z*x-c-2,11*y+2,1);
   plot(z*x-c,11*y-5,0);
   plot(z*x-c+3,11*y-5,1);
   plot(z*x-c-5,11*y-2,0);
   plot(z*x-c-2,11*y-2,1);
   plot(z*x-c+5,11*y-2,0);
   plot(z*x-c+8,11*y-2,1);
   end;
   read(kbd,g);
end.