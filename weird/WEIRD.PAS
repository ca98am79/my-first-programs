program weird(input,output);
var x:integer;
begin
   graphcolormode;
   graphbackground(1);
   palette(2);
  repeat
   for x:=1 to 100 do
    begin
     draw(x,x,320-x,x,1);
     draw(x,200-x,320-x,200-x,1);
     draw(x,x,x,200-x,1);
     draw(320-x,x,320-x,200-x,1);
    end;
   for x:=1 to 100 do
    begin
     draw(x,x,320-x,x,0);
     draw(x,200-x,320-x,200-x,0);
     draw(x,x,x,200-x,0);
     draw(320-x,x,320-x,200-x,0);
    end;
  until keypressed;
end.