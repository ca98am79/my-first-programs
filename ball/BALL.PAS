program ball(input,output);
{$I ball.inc}
{$I lifter.inc}
{$I blank.inc}
{$I sprites.lib}
var xx,todd,sum,j,x:integer;
begin
 graphcolormode;
 graphbackground(7);
 palette(2);
 draw(160,30,1,30,blue);
 draw(160,31,1,31,blue);
 repeat
 sum:=0;
 todd:=0;
 move(blank,sprite,128);
 putspritec(9,30);
 while sum<9 do
  begin
   sum:=sum+1;
{   write(sum:1,' ');}
   for x:=sum to 9 do
   begin
 {   write(x);}
    move(o,sprite,128);
    putspritec(160,20*x);
    for j:=1 to 1000 do;
    move(blank,sprite,128);
    putspritec(160,20*x);
   end;
{   writeln;           }
   move(t,sprite,128);
   putspritec(160,185);
   for x:=1 to 1000 do;
   move(th,sprite,128);
   putspritec(160,190);
   for x:=1 to 1000 do;
   move(t,sprite,128);
   putspritec(160,185);
   for x:=1 to 1000 do;
   move(blank,sprite,128);
   putspritec(160,188);
   for x:=1 to 9-sum do
   begin
    move(o,sprite,128);
    putspritec(160,200-20*x);
    for j:=1 to 1000 do;
    move(blank,sprite,128);
    putspritec(160,200-20*x);
   end;
   if (sum=9) and (todd<2) then begin
    todd:=todd+1;
    sum:=sum-1;
   end;
  end;
  move(o,sprite,128);
  putspritec(160,190);
  for x:=1 to 150 do
   putspritec(160-x,190);
  for x:=1 to 170 do begin
   putspritec(10,190-x);
   move(lift,sprite,128);
   putspritec(10,190-x+20);
   move(o,sprite,128);
   end;
  for x:=1 to 150 do
   putspritec(10+x,20);
  until keypressed;
end.
