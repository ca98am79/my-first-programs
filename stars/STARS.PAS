program stars(output);
var
   h,a,b,c,d,e,f:integer;
   g:char;
begin
   hires;
   for b:=1 to 10 do
   for a:=1 to 20 do
     plot(a*30,b*20,white);
   for a:=1 to 4 do
   begin
     plot(a*30,60,0);
     plot(a*30-5,60,1);
     plot(a*30,120,0);
     plot(a*30-5,120,1);
     plot(a*30,100,0);
     plot(a*30-10,100,1);
   end;
   plot(210,80,0);
   plot(205,80,1);
   plot(180,80,0);
   plot(175,80,1);
   plot(150,80,0);
   plot(140,80,1);
   plot(120,80,0);
   plot(105,80,1);
   for a:=1 to 3 do
   begin
      plot(a*30,80,0);
      plot(a*30-15,80,1);
   end;
   plot(180,100,0);
   plot(175,100,1);
   plot(150,100,0);
   plot(145,100,1);
   for a:=9 to 20 do
   begin
    plot(a*30,60,0);
    plot(a*30+5,60,1);
   end;
   for b:=9 to 10 do
   for a:=5 to 6 do
   begin
    plot(b*30,a*20,0);
    plot(b*30+5,a*20,1);
   end;
   for a:=1 to 10 do
   begin
    plot(a*30,140,0);
    plot(a*30+5,140,1);
    plot(a*30,160,0);
    plot(a*30+10,160,1);
   end;
   plot(360,160,0);
   plot(365,160,1);
   plot(330,160,0);
   plot(340,160,1);
   plot(270,80,0);
   plot(275,80,1);
   plot(300,80,0);
   plot(305,80,1);
   plot(330,80,0);
   plot(335,80,1);
   plot(390,80,0);
   plot(385,80,1);
   for a:=14 to 20 do
   begin
    plot(a*30,80,0);
    plot(a*30-10,80,1);
    plot(a*30,160,0);
    plot(a*30-5,160,1);
   end;
   read(kbd,g);
end.
