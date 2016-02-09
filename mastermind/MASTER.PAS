program mastermind(input,output);
{$I pieces.inc}
{$I sprites.lib}
type
  players=array [1..4] of char;
var
   x,jay,xx,acount,f,s,t,fo:integer;
   player,comp:players;
   choice:char;
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
                var x,acount:integer);
type
   it=array [1..4] of integer;
var j,jj,reds,yellows:integer;
    i:it;
begin
   reds:=0; yellows:=0;
   for j:=1 to 4 do
     i[j]:=0;
   for j:=1 to 4 do
   begin
      if player[j]=comp[j] then
      begin
      reds:=reds+1;
      i[j]:=1;
      end;
   end;
   for jj:=1 to 3 do
    begin
       if acount=0 then
       begin
        if i[1+jj]=0 then
        begin
         if (player[1]=comp[1+jj]) and (i[1]=0) then
         begin
          if (jj=1) or ((jj=3) or (jj=4)) then begin
          if ((player[2]<>comp[3]) and (player[4]<>comp[3])) then
          yellows:=yellows+1;
          end
          else yellows:=yellows+1;
         end;
        end;
        acount:=yellows;
       end;
    end;
   for jj:=1 to 3 do
     begin
      if (acount=0) or (acount=1) then
       begin
       acount:=yellows;
       if acount>=yellows then
       begin
        if i[4-jj]=0 then
        begin
         if (player[4]=comp[4-jj]) and (i[4]=0) then
         if ((player[3]<>comp[2]) and (player[1]<>comp[2])) then
         yellows:=yellows+1;
        end;
       end;
       end;
    end;
       if (i[2]=0) then
       begin
         if i[1]=0 then
         begin
           if (player[2]=comp[1]) then
           yellows:=yellows+1;
         end;
         if i[3]=0 then
         begin
           if (player[2]=comp[3]) and ((player[1]<>comp[3]) or (player[4]<>comp[3])) then
           if player[1]<>comp[3] then
           yellows:=yellows+1;
         end;
         if i[4]=0 then
         begin
           if (player[2]=comp[4]) and (player[1]<>comp[4]) then
           yellows:=yellows+1;
         end;
       end;
       acount:=yellows;
       if (i[3]=0) then
       begin
         if i[1]=0 then
         begin
          if (player[3]=comp[1]) then
          yellows:=yellows+1;
         end;
         if i[2]=0 then
         begin
          if (player[3]=comp[2]) and (player[1]<>comp[2]) then
          yellows:=yellows+1;
         end;
         if i[4]=0 then
         begin
          if (player[3]=comp[4]) and ((player[2]<>comp[4]) or (player[1]<>comp[4])) then
          yellows:=yellows+1;
         end;
       end;
       acount:=yellows;
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
  acount:=0;
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
  acount:=0;
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