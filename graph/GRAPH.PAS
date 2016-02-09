program graph(input,output);
var
   t,u,v,w,x,y,z:integer;
begin
   graphcolormode;
   graphbackground(1);
   palette(2);
   x:=0;
   t:=0;
   z:=round(random(199)+1);
   for v:=1 to 10 do
   begin
      x:=x+30;
      y:=round(random(199)+1);
      t:=t+y;
      draw(x-30,z,x,y,1);
      z:=y;
   end;
   u:=round(t/10);
   draw(1,u,320,u,2);
end.