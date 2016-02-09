program pop(input,output);
var
 i:integer;
 j:char;
{--------------------------BOX}
procedure box(x1,y1,x2,y2,color:integer);
begin
 draw(x1,y1,x1,y2,color);
 draw(x1,y2,x2,y2,color);
 draw(x2,y2,x2,x1,color);
end;
{---------------------------OPENWINDOW}
procedure openwindow(x1,y1,x2,y2,boundarycolor,insidecolor:integer);
begin
box(x1,y1,x2,y2,boundarycolor);
graphwindow(x1+1,y1+1,x2-1,y2-1);
gotoxy(40,16);
writeln('HELLO HELLO HELLO');
end;
{----------------------------MAIN}
begin
palette(2);
graphcolormode;
for i:=1 to 20 do
   draw(0,i*10,319,i*10,3);
openwindow(100,50,270,150,3,1);
for i:=1 to 20 do
   draw(i*8,0,i*8,100,3);
readln;
textmode;
end.
