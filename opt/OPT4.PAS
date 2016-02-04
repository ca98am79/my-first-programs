program nothing(input,output);
var x,y,w,z:integer;
   g:char;
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
   for w:=1 to 19 do
   for z:=1 to 20 do
      circle(z*x,w*y,1);
   for w:=6 to 14 do
   for z:=8 to 12 do
   begin
      circle(z*x,w*y,0);
      circle(z*x+14-w,w*y,1);
   end;
   read(kbd,g);
end.