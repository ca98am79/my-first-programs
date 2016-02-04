program nothing(input,output);
var x,y,w,z:integer;
   g:char;
{=========}
procedure circle(x,y:integer);
begin
   plot(x+10,y,1);
   plot(x-10,y,1);
   plot(x,y+5,1);
   plot(x,y-5,1);
   plot(x+5,y+2,1);
   plot(x-5,y+2,1);
   plot(x+5,y-2,1);
   plot(x-5,y-2,1);
end;
{===========}
begin
   x:=30;
   y:=10;
   hires;
   for w:=1 to 19 do
   for z:=1 to 20 do
      circle(z*x,w*y);
   for w:=4 to 8 do
   for z:=1 to (12-w) do
  begin
   plot(z*30,w*10+5,0);
   plot(z*30-5,w*10+5,1);
   plot(z*30-5,w*10+2,0);
   plot(z*30-10,w*10+2,1);
   plot(z*30+5,w*10+2,0);
   plot(z*30,w*10+2,1);
   plot(z*30+10,w*10,0);
   plot(z*30+5,w*10,1);
   plot(z*30+5,w*10-2,0);
   plot(z*30,w*10-2,1);
   end;
   for w:=9 to 13 do
   for z:=(23-w) to 20 do
   begin
   plot(z*30,w*10+5,0);
   plot(z*30+5,w*10+5,1);
   plot(z*30-5,w*10+2,0);
   plot(z*30,w*10+2,1);
   plot(z*30+5,w*10+2,0);
   plot(z*30+10,w*10+2,1);
   plot(z*30+10,w*10,0);
   plot(z*30+15,w*10,1);
   plot(z*30+5,w*10-2,0);
   plot(z*30+10,w*10-2,1);
 end;
   for w:=4 to 8 do
   for z:=(w+6) to 20 do
   begin
   plot(z*30,w*10+5,0);
   plot(z*30+5,w*10+5,1);
   plot(z*30-5,w*10+2,0);
   plot(z*30,w*10+2,1);
   plot(z*30+5,w*10+2,0);
   plot(z*30+10,w*10+2,1);
  plot(z*30-10,w*10,0);
   plot(z*30-5,w*10,1);
  plot(z*30-5,w*10-2,0);
   plot(z*30,w*10-2,1);
   end;
  for w:=9 to 13 do
   for z:=1 to (w-5) do
   begin
   plot(z*30,w*10+5,0);
   plot(z*30-5,w*10+5,1);
   plot(z*30-5,w*10+2,0);
   plot(z*30-10,w*10+2,1);
   plot(z*30+5,w*10+2,0);
   plot(z*30,w*10+2,1);
  plot(z*30-10,w*10,0);
   plot(z*30-15,w*10,1);
  plot(z*30-5,w*10-2,0);
   plot(z*30-10,w*10-2,1);
   end;
   read(kbd,g);
end.