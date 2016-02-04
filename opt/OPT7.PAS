program nothing(input,output);
var a,b,x,y,w,z:integer;
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
   a:=0;
   x:=30;
   y:=10;
   hires;
   for w:=1 to 19 do
   for z:=1 to 21 do
      circle(z*x,w*y,1);
   for w:=6 to 14 do
   for z:=8 to 21 do
      circle(z*x,w*y,0);
   for w:=6 to 14 do
   begin
    a:=0;
    b:=0;
   for z:=8 to 22 do
   begin
      a:=14-w+a-abs(8-z);
      if a>b then
      circle(z*x+a,w*y,1)
      else
      circle(z*x+b,w*y,1);
      if a>b then
      b:=a;
   end;
   end;
   circle(21*x,14*y,1);
   read(kbd,g);
end.