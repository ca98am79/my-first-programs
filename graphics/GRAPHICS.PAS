program graphics(output);
var
   w,x,y,z,a,m:integer;
begin
   HiRes;
   for x:=0 to 639 do
      Plot(x,0,white);
   for y:=0 to 199 do
      Plot(639,y,white);
   for x:=639 downto 0 do
      plot(x,199,white);
   for y:=199 downto 0 do
      plot(270,y,white);
      repeat
      begin
      draw(0,0,0,199,white);
      draw(0,199,639,199,white);
      draw(639,199,639,0,white);
      draw(639,0,0,0,white);
      draw(320,100,random(640),random(200),white);
      end;
      until keypressed;
end.


