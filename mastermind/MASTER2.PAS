program mastermind(input,output);
{$I pieces.inc}
{$I sprites.lib}
type
  players=array [1..4] of char;
  acounttype=array [1..4] of real;
var
   x,jay,xx,f,s,t,fo:integer;
   player,comp:players;
   choice:char;
   acount:acounttype;
{------------------------DRAWKEY}
procedure drawkey;
begin
  move(red,sprite,128);
  putspritec(21,150);
  move(green,sprite,128);
  putspritec(44,150);
  move(yellow,sprite,128);
  putspritec(69,150);
  move(redyellow,sprite,128);
  putspritec(95,150);
  move(greenred,sprite,128);
  putspritec(118,150);
  move(yellowred,sprite,128);
  putspritec(141,150);
  for x:=1 to 3 do writeln;
  write('     HIDDEN ANSWER');
  for x:=1 to 14 do writeln;
  writeln('  1  2  3  4  5  6');
end;
{-----------------------PASTE}
procedure paste(xx,x:integer;
                choice:char);
begin
   if choice='1' then begin
   move(red,sprite,128);
   putspritec(210+20*xx,20*x-26);
   end;
   if choice='2' then begin
   move(green,sprite,128);
   putspritec(210+20*xx,20*x-26);
   end;
   if choice='3' then begin
   move(yellow,sprite,128);
   putspritec(210+20*xx,20*x-26);
   end;
   if choice='4' then begin
   move(redyellow,sprite,128);
   putspritec(210+20*xx,20*x-26);
   end;
   if choice='5' then begin
   move(greenred,sprite,128);
   putspritec(210+20*xx,20*x-26);
   end;
   if choice='6' then begin
   move(yellowred,sprite,128);
   putspritec(210+20*xx,20*x-26);
   end;
end;
{-----------------------SEEIF}
procedure seeif(player,comp:players;
                var x:integer;
                var turn:acounttype);
type
   it=array [1..4] of integer;
var j,jj,reds,yellows:integer;
    i:it;
begin
   reds:=0; yellows:=0;
   for j:=1 to 4 do
     turn[j]:=0;
   for j:=1 to 4 do
   begin
      if player[j]=comp[j] then
      begin
      reds:=reds+1;
      turn[j]:=(11*j)/10;
      end;
   end;
   if (player[1]=comp[2]) and (turn[1]<>1.1) then
    begin
    yellows:=yellows+1;
    turn[1]:=1.2;
    end;
   if (player[1]=comp[3]) and ((turn[1]<>1.2) and (turn[1]<>1.1)) then
    begin
    yellows:=yellows+1;
    turn[1]:=1.3;
    end;
   if (player[1]=comp[4]) and ((turn[1]<>1.2) or ((turn[1]<>1.3) and (turn[1]<>1.1))) then
   begin
    yellows:=yellows+1;
    turn[1]:=1.4;
    end;
   if (player[2]=comp[1]) and (turn[2]<>2.2) then
    begin
    yellows:=yellows+1;
    turn[2]:=2.1;
    end;
   if (player[2]=comp[3]) and ((turn[2]<>2.1) and (turn[2]<>2.2)) then
    begin
    yellows:=yellows+1;
    turn[2]:=2.3;
    end;
   if (player[2]=comp[4]) and ((turn[2]<>2.1) and ((turn[2]<>2.2) and (turn[2]<>2.2))) then
    begin
    yellows:=yellows+1;
    turn[2]:=2.4;
    end;
   if (player[3]=comp[1]) and (turn[3]<>3.3) then
    begin
    yellows:=yellows+1;
    turn[3]:=3.1;
    end;
   if (player[3]=comp[2]) and ((turn[3]<>3.1) and (turn[3]<>3.3)) then
    begin
    yellows:=yellows+1;
    turn[3]:=3.2;
    end;
   if (player[3]=comp[4]) and ((turn[3]<>3.1) and ((turn[3]<>3.2) and (turn[3]<>3.3))) then
    begin
    yellows:=yellows+1;
    turn[3]:=3.4;
    end;
   if (player[4]=comp[1]) and (turn[4]<>4.4) then
    begin
    yellows:=yellows+1;
    turn[4]:=4.1;
    end;
   if (player[4]=comp[2]) and ((turn[4]<>4.1) and (turn[4]<>4.4)) then
    begin
    yellows:=yellows+1;
    turn[4]:=4.2;
    end;
   if (player[4]=comp[3]) and ((turn[4]<>4.1) and ((turn[4]<>4.2) and (turn[4]<>4.4))) then
    begin
    yellows:=yellows+1;
    turn[4]:=4.3;
    end;
   move(smallyellow,sprite,128);
   for jj:=1 to yellows do
    putspritec(165+jj*15+3,x*21-40);
   move(smallred,sprite,128);
   if reds<4 then begin
   for jj:=1 to reds do
    putspritec(165+jj*15+3,x*21-29);
   end
   else begin
   for jj:=1 to reds do
    putspritec(150+jj*15+3,x*21-29);
    x:=777;
   end;
end;
{-----------------------MAIN}
begin
  graphcolormode;
  palette(2);
  graphbackground(8);
  f:=random(5)+1;
  s:=random(5)+1;
  t:=random(5)+1;
  fo:=random(5)+1;
  write(f:1,' ',s:1,' ',t:1,' ',fo:1);
  drawkey;
  comp[1]:=chr(f+48);
  comp[2]:=chr(s+48);
  comp[3]:=chr(t+48);
  comp[4]:=chr(fo+48);
  writeln;
  writeln;
  writeln('Enter choice #');
  x:=1;
  repeat
  x:=x+1;
   for xx:=1 to 4 do
    begin
      read(kbd,choice);
      paste(xx,x,choice);
      player[xx]:=choice;
    end;
  seeif(player,comp,x,acount);
  until x>10;
  for xx:=1 to 3000 do;
  if x>776 then
  begin
  writeln(' YOU   WON!!!!!!!!!!');
  end
  else
  begin
  writeln('Sorry, you lost');
  end;
  for jay:=1 to 4 do
  begin
   choice:=comp[jay];
   if choice='1' then begin
   move(red,sprite,128);
   putspritec(50+17*jay,30);
   end;
   if choice='2' then begin
   move(green,sprite,128);
   putspritec(50+17*jay,30);
   end;
   if choice='3' then begin
   move(yellow,sprite,128);
   putspritec(50+17*jay,30);
   end;
   if choice='4' then begin
   move(redyellow,sprite,128);
   putspritec(50+17*jay,30);
   end;
   if choice='5' then begin
   move(greenred,sprite,128);
   putspritec(50+17*jay,30);
   end;
   if choice='6' then begin
   move(yellowred,sprite,128);
   putspritec(50+17*jay,30);
  end;
  end;
end.
