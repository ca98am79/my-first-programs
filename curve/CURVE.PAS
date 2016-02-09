program curve(input,output);
var t,u,v,w,x,y,z:integer;
begin
   graphcolormode;
   graphbackground(1);
   palette(2);
   repeat
    u:=random(300)+10;
    v:=random(20)+1;
    for t:=-100 to 100 do
    begin
       draw(t+u,round(sqr(t)/v),(t+1)+u,round(sqr(t+1)/v),1);
    end;
   until keypressed;
end.
