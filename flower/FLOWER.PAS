program flower(input,output);
var
  x,y,x1,j,y1,sub:integer;
  can:boolean;
  choice:char;
begin
   x:=160;
   writeln('Press ''q''');
   writeln('to quit.');
   graphcolormode;
   palette(1);
   writeln('Press ''q''');
   writeln('to quit.');
   y:=1;
   sub:=0;
   can:=false;
{   repeat}
    sub:=0;
    x1:=random(320);
    y1:=random(200);
    repeat
    x:=random(3)+1;
    if x=y1 then x:=random(3)+1;
    y1:=x;
    palette(x);
    y:=random(30);
    for j:=1 to y do  begin
      sub:=j*2;
      draw(160,100,160+sub,1+j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*1;
      draw(160,100,220+sub,30+j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*1;
      draw(160,100,250+sub,60+j,x);
     end;
    for j:=1 to y do  begin
      sub:=j div 2;
      draw(160,100,280-sub,90+j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*2;
      draw(160,100,265-sub,120+j,x);
     end;
    for j:=1 to y do begin
      sub:=j*2;
      draw(160,100,205-sub,150+j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*2;
      draw(160,100,145-sub,180-j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*1;
      draw(160,100,85-sub,150-j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*1;
      draw(160,100,55-sub,120-j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*1;
      draw(160,100,25+sub,90-j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*2;
      draw(160,100,55+sub,60-j,x);
     end;
    for j:=1 to y do  begin
      sub:=j*1;
      draw(160,100,115+sub,30-j,x);
     end;
    for j:=1 to 10 do  begin
      sub:=j*2;
      draw(160,100,145+sub,1,x);
     end; x1:=random(320);
    y1:=random(200);
   sub:=0;
{    for j:=1 to 25 do begin
       draw(160,100,x1+sub,y1+sub,random(4));
       sub:=sub+5;
     end;}
     read(kbd,choice);
     until choice='q';
end.
