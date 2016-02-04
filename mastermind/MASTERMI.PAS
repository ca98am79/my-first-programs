program mastermind(input,output);
{---------------------------}
{   BY:    MIKE CARSON      }
{---------------------------}
{       7/3/1992            }
{                           }
const
  left=#$4b;
{$I sprites.lib}
{$I pieces.inc}
{$I letters.inc}
{$I blank.inc}
type
  players=array [1..4] of char;
  acounttype=array [1..4] of real;
var yn:char;
{------------------------TITLE}
{Title screen}
{$I title.inc}
{------------------------DRAWKEY}
procedure drawkey;
{Draws the key to the different pieces and their numbers}
var x:integer;
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
{Pastes the pieces on the board while you enter them}
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
{Checks the positions of your guess to his
set up; the thinking part of this program}
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
      turn[j]:=(11*j)*0.1;
      end;
   end;
   if player[1]<>comp[1] then begin
   if (player[2]=comp[1]) and ((player[2]<>comp[2]) and (player[1]<>comp[1])) then
    begin
    yellows:=yellows+1;
    turn[2]:=2.1;
    end
   else if (player[3]=comp[1]) and ((player[3]<>comp[3]) and (player[1]<>comp[1])) then
    begin
    yellows:=yellows+1;
    turn[3]:=3.1;
    end
   else if (player[4]=comp[1]) and ((player[4]<>comp[4]) and (player[1]<>comp[1])) then
    begin
    yellows:=yellows+1;
    turn[4]:=4.1;
    end; end;
   if player[2]<>comp[2] then begin
   if (player[1]=comp[2]) and (player[1]<>comp[1]) then
    begin
    yellows:=yellows+1;
    turn[1]:=1.2;
    end
   else if (player[3]=comp[2]) and (player[3]<>comp[3]) then
    begin
    if player[3]<>comp[1] then begin
    yellows:=yellows+1;
    turn[3]:=3.2;
    end
    else if (player[3]=comp[1]) and ((player[4]=comp[1]) or (player[1]=comp[1])) then begin
    yellows:=yellows+1;
    turn[3]:=3.2;
    end; end
   else if (player[4]=comp[2]) and (player[4]<>comp[4]) then
    begin
    if player[4]<>comp[1] then begin
    yellows:=yellows+1;
    turn[4]:=4.2;
    end
    else if (player[4]=comp[1]) and (player[1]=comp[1]) then begin
    yellows:=yellows+1;
    turn[4]:=4.2;
    end; end
   end;
   if player[3]<>comp[3] then begin
   if (player[1]=comp[3]) and ((player[1]<>comp[1]) or (player[4]=comp[3])) then
    begin
    if (player[1]<>comp[2]) then begin
    yellows:=yellows+1;
    turn[1]:=1.3;
    end
    else if (player[1]=comp[2]) and ((player[2]=comp[2]) or ((player[4]=comp[2]) or (player[3]=comp[2]))) then begin
    yellows:=yellows+1;
    turn[1]:=1.3;
    end;
    end
   else if (player[2]=comp[3]) and ((player[2]<>comp[2]) and (player[3]<>comp[3])) then
    begin
    if (player[2]<>comp[1]) then begin
    yellows:=yellows+1;
    turn[2]:=2.3;
    end
    else if (player[2]=comp[1]) and ((player[1]=comp[1]) or ((player[2]=player[4]) or (player[2]=comp[3]))) then begin
    yellows:=yellows+1;
    turn[2]:=2.3;
    end;
    end
   else if (player[4]=comp[3]) and ((player[4]<>comp[1]) and (player[4]<>comp[4])) then
    begin
    if player[4]<>comp[2] then begin
    yellows:=yellows+1;
    turn[4]:=4.3;
    end
    else if (player[4]=comp[2]) and ((player[1]=comp[2]) or ((player[3]=comp[2]) or (player[2]=comp[2]))) then begin
     yellows:=yellows+1;
     turn[4]:=4.3;
    end; end
    end;
   if player[4]<>comp[4] then begin
   if (player[1]=comp[4]) and ((player[1]<>comp[3]) or (player[2]=comp[4])) then
    begin
    if (player[1]<>comp[1]) and (player[1]<>comp[2]) then begin
    yellows:=yellows+1;
    turn[1]:=1.4;
    end
    else if (player[1]=comp[2]) and ((player[2]=comp[2]) or (player[1]=player[3])) then begin
    yellows:=yellows+1;
    turn[1]:=1.4;
    end;
    end
   else if (player[2]=comp[4]) and ((player[2]<>comp[2]) or (player[3]=comp[2])) then
    begin
   if (player[2]<>comp[1]) and (player[2]<>comp[3]) then begin
    yellows:=yellows+1;
    turn[2]:=2.4;
    end
    else if (player[2]=comp[1]) and ((player[1]=comp[1]) and (player[2]<>comp[3])) then begin
    yellows:=yellows+1;
    turn[2]:=2.4;
    end
    else if (player[2]<>comp[1]) and (player[2]=comp[3]) then begin
    if player[3]=comp[3] then begin
     yellows:=yellows+1;
     turn[2]:=2.4;
     end; end;
    end
  else if (player[3]=comp[4]) and (player[3]<>comp[3]) then
    begin
     if (player[3]<>comp[1]) and (player[3]<>comp[2]) then begin
     yellows:=yellows+1;
     turn[2]:=2.4;
     end
     else if (player[3]=comp[1]) and ((player[1]=comp[1]) and (player[3]<>comp[2])) then begin
     yellows:=yellows+1;
     turn[2]:=2.4;
     end
     else if (player[3]<>comp[1]) and (player[3]=comp[2]) then begin
     if player[3]=comp[3] then begin
      yellows:=yellows+1;
      turn[2]:=2.4;
      end; end;
     end
    end;
   move(smallyellow,sprite,128);
   for jj:=1 to yellows do begin
    if (yellows<3) or (jj<3) then
    putspritec(165+jj*15+3,x*21-40)
    else if yellows=4 then putspritec(165+(jj-2)*15+3,x*21-29)
    else putspritec(165+(jj-1)*15+3,x*21-29);
   end;
   move(smallred,sprite,128);
   for jj:=1 to reds do begin
    if (reds<3) or (jj<3) then
    putspritec(165+jj*15+3,x*21-29)
    else if yellows=1 then putspritec(165+(jj-1)*15+3,x*21-40)
    else putspritec(165+(jj-2)*15+3,x*21-40);
   end;
   gotoxy(30,170);
   if reds>3 then x:=777;
end;
{--------------------------------LEGEND}
procedure legend;
var a:char;
begin
move(smallred,sprite,128);
putspritec(5,70);
gotoxy(5,9);
writeln('Right color,'); writeln('    right position.');
move(smallyellow,sprite,128);
putspritec(5,100);
gotoxy(5,13);
writeln('Right color,'); writeln('    wrong position.');
read(kbd,a);
move(blank,sprite,128);
putspritec(5,100);
putspritec(5,70);
gotoxy(5,9);
writeln('            '); writeln('                   ');
gotoxy(5,13);
writeln('            '); writeln('                   ');
writeln;
end;
{--------------------------------INSTRUCTIONS}
procedure instructions;
var chopsuwe:char;
begin
graphbackground(1);
textbackground(1);
textcolor(15);
clrscr;
writeln('MASTERMIND');
writeln;
writeln;
writeln('     To start with, the object of Mastermind is for you, the Codebreaker, to');
writeln('break the  secret color-peg code  which the  computer, or the Codemaker, has');
writeln('randomly chosen.  You break the code by chosing  different pegs which  helps');
writeln('you eliminate colors and positions. At the beggining, you select which level');
writeln('you would like  to be playing  against.  The level which you  choose  is the');
writeln('number of guesses you will have to break the code.  Next, you will start the');
writeln('game.  In the top left-hand  corner of the screen  will be the guess  number');
writeln('you are on out of how many guesses you have (your level).  Below  it will be');
writeln('the  computer''s hidden code, which  will  stay hidden  until you run  out of');
writeln('guesses and lose or when you break the code.  Further down  the screen  will');
writeln('be the translator, which indicates which number you press for the color  you');
writeln('want when you are trying to break the code.  After you  enter four  numbers,');
writeln('for their matching colors, you will be  given clues by  the  computer  which');
writeln('help you to break the code.   The clues will  immediatley appear to the left');
writeln('of your guess after your fourth color has been entered. If a red dot appears');
writeln('it means that one of your four pegs is in the right position,  if  a  yellow');
writeln('dot appears it means that one of  your pegs is the  right color  but in  the');
writeln('wrong position. (you can press ''?'' anytime during the game for  this  info.)');
writeln;
writeln('Press any key to start.');
read(kbd,chopsuwe);
end;

{--------------------------------Driver}
{drives the program (calls procedures, etc..)}
procedure driver;
var
   x,level,jay,xx,f,s,t,fo:integer;
   player,comp:players;
   choice,lev:char;
   acount:acounttype;
begin
  repeat
  clrscr;
  writeln('What level?  (1 is hardest, 10 is easiest)');
  writeln('Press 0 for level 10.');
  writeln;
  read(kbd,lev);
  level:=ord(lev)-48;
  if lev='0' then level:=10;
  until (level<11) and (level>0);
  graphcolormode;
  palette(2);
  graphbackground(1);
  textbackground(1);
  textcolor(15);
  gotoxy(1,1);
  write('Guess:');
  f:=random(6)+1;
  s:=random(6)+1;
  t:=random(6)+1;
  fo:=random(6)+1;
{  f:=4; s:=1; t:=4; fo:=1;}
{  write(f:1,' ',s:1,' ',t:1,' ',fo:1);}
  drawkey;
  comp[1]:=chr(f+48);
  comp[2]:=chr(s+48);
  comp[3]:=chr(t+48);
  comp[4]:=chr(fo+48);
  writeln;
  writeln;
  writeln('Enter choice #');
  writeln;
  writeln('Press ''?'' for key');
  writeln('or ''Q'' to quit.');
  x:=1;
  repeat
  gotoxy(1,1);
  write('Guess:',x:1,'  Out of:',level:1);
  x:=x+1;
  xx:=0;
   while xx<4 do
    begin
      xx:=xx+1;
      gotoxy(1,23);
      read(kbd,choice);
      if (choice='q') or (choice='Q') then begin clrscr; halt; end;
      paste(xx,x,choice);
      player[xx]:=choice;
      if choice='?' then legend;
      if ((ord(choice)-48)<1) or ((ord(choice)-48)>6) then xx:=xx-1;
      end;
  seeif(player,comp,x,acount);
   until x>level;
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
  for xx:=1 to 3000 do;
  read(kbd,choice);
  clrscr;
  textbackground(1);
  textcolor(15);
  graphbackground(1);
  clrscr;
  if x>776 then begin
  for jay:=1 to 7 do writeln;
  writeln('                      Congratulations!  You win.');
  for jay:=1 to 5 do writeln;
  end
  else
  begin
  clrscr;
  for jay:=1 to 7 do writeln;
  writeln('                                 Game Over');
  for jay:=1 to 5 do writeln;
  end;
  end;
  {-------------------------MAIN}
  {Calls title and driver, which calls other procedures}
  begin
   title;
   read(kbd,yn);
   clrscr;
   graphbackground(1);
   textbackground(1);
   textcolor(15);
   clrscr;
   writeln('Need instructions?  Y/N');
   read(kbd,yn);
   clrscr;
   if (yn='y') or (yn='Y') then instructions;
   repeat
    textcolor(15);
    textbackground(1);
    graphbackground(1);
    clrscr;
    driver;
    writeln('Do you want to play again? Y/N');
    read(kbd,yn);
   until (yn='n') or (yn='N');
 end.
