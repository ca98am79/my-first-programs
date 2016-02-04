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
   for z:=7 to 13 do
   for w:=5 to 21 do
      circle(w*x,z*y,0);
   for z:=7 to 13 do
   for w:=5 to 20 do
   begin
      if w<14 then
      a:=(w-5)*3
      else a:=27;
      c:=trunc(a);
      circle(w*x+c,z*y,1);
   end;
   read(kbd,g);
end.