program stars(output);
var
   h,a,b,c,d,e,f:integer;
   g:char;
begin
   hires;
   for b:=1 to 10 do
   for a:=1 to 20 do
   plot(a*30,b*20,white);
   plot(300,100,black);
   plot(302,100,1);
   plot(300,120,black);
   plot(302,120,1);
   plot(330,100,black);
   plot(332,100,1);
   plot(330,120,black);
   plot(332,120,1);
   read(kbd,g);
end.
