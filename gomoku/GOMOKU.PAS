program gomoku(input,output);
type
   boardtype=array[0..20,0..20] of integer;
var
   board:boardtype;
   who,hisx,hisy,movex,movey:integer;
   won:boolean;
   first:string[20];
{----------------------------------------INIT}
procedure init(var board:boardtype);
var x,y:integer;
begin
   for x:=0 to 20 do
      for y:=0 to 20 do
         board[x,y]:=0;
end;
{----------------------------------------PRINT}
procedure print(board:boardtype);
var x,y:integer;
begin
 for x:=1 to 19 do
  begin
     write(x:1);
     if x<10 then write(' ');
    for y:=1 to 19 do
       begin
          if board[x,y]=0 then write(' . ')
          else if board[x,y]=1 then
            begin
               textcolor(15);
               write(' @ ');
            end
          else if board[x,y]=2 then
            begin
               textcolor(2);
               write(' @ ');
            end;
         textcolor(7);
       end;
     writeln;
  end;
  write(' ');
  for x:=1 to 19 do
   begin
     if x<10 then write(' ');
     write(' ',x:1);
   end;
  writeln;
end;
{-----------------------------------MOVE}
procedure move(var board:boardtype;
               var movex,movey:integer);
var ch1,ch2:char;
begin
 repeat
   textcolor(15);
   writeln('What is your move? (horizontal)');
   repeat
    read(kbd,ch1);
   until (ord(ch1)>47) and (ord(ch1)<58);
   write(ch1);
   read(kbd,ch2);
   if (ch2>='0') and (ch2<='9') then
     write(ch2);
   writeln;
   if (ord(ch2)<58) and (ord(ch2)>47) then movex:=(ord(ch1)-48)*10+(ord(ch2)-48)
   else movex:=ord(ch1)-48;
   writeln('What is your move? (vertical)');
   repeat
    read(kbd,ch1);
   until (ord(ch1)>47) and (ord(ch1)<58);
   write(ch1);
   read(kbd,ch2);
   if (ch2>='0') and (ch2<='9') then
    write(ch2);
   writeln;
   if (ord(ch2)<58) and (ord(ch2)>47) then movey:=(ord(ch1)-48)*10+(ord(ch2)-48)
   else movey:=ord(ch1)-48;
   textcolor(7);
 until ((board[movex,movey]=0) and ((movex<20) and (movey<20)));
 board[movex,movey]:=1;
end;
{-----------------------------------WIN}
function win(board:boardtype;
             movex,movey,color,goal:integer):boolean;
var x,y:integer;
begin
   x:=0;
   repeat
      x:=x+1;
   until (board[movex+x,movey]<>color);
   x:=x-1;
   y:=0;
   repeat
      y:=y+1;
   until (board[movex-y,movey]<>color);
   y:=y-1;
   if (x+y)>goal then win:=true
   else
     begin
     x:=0;
      repeat
       x:=x+1;
      until (board[movex,movey+x]<>color);
      x:=x-1;
      y:=0;
      repeat
       y:=y+1;
      until (board[movex,movey-y]<>color);
      y:=y-1;
      if (x+y)>goal then win:=true
      else
        begin
         x:=0;
   repeat
      x:=x+1;
   until (board[movex+x,movey+x]<>color);
   x:=x-1;
   y:=0;
   repeat
      y:=y+1;
   until (board[movex-y,movey-y]<>color);
   y:=y-1;
   if (x+y)>goal then win:=true
   else
     begin
     x:=0;
      repeat
       x:=x+1;
      until (board[movex-x,movey+x]<>color);
      x:=x-1;
      y:=0;
      repeat
       y:=y+1;
      until (board[movex+y,movey-y]<>color);
      y:=y-1;
      if (x+y)>goal then win:=true
      else win:=false;
     end;
    end;
    end;
end;
{-----------------------------------COMP}
procedure comp(var board:boardtype;
               movex,movey:integer;
               var hisx,hisy:integer);
type
   movest=record
       xmove,ymove:integer;
       value:real;
     end;
   movestype=array[1..300] of movest;
var w,x,y,z:integer;
    moves:movestype;
    ctr:integer;
    val:real;
begin
   z:=5;
   ctr:=0;
   repeat
   z:=z-1;
   for x:=1 to 19 do
     for y:=1 to 19 do
      if (win(board,x,y,2,z-1)) then
        if (board[x,y]=0) then
        begin
         ctr:=ctr+1;
         moves[ctr].xmove:=x;
         moves[ctr].ymove:=y;
         moves[ctr].value:=z+0.5;
         for w:=4 downto 1 do
           if (win(board,x,y,1,w-1)) then
             moves[ctr].value:=moves[ctr].value+(w/10);
        end;

   for x:=1 to 19 do
     for y:=1 to 19 do
       if (win(board,x,y,1,z-1)) then
            if (board[x,y]=0) then
            begin
             ctr:=ctr+1;
             moves[ctr].xmove:=x;
             moves[ctr].ymove:=y;
             moves[ctr].value:=z;
             for w:=4 downto 1 do
               if win(board,x,y,2,w-1) then
                 moves[ctr].value:=moves[ctr].value+(w/10);
            end;
   until (z=1);
   hisx:=moves[1].xmove;
   hisy:=moves[1].ymove;
   val:=moves[1].value;
   for w:=2 to ctr do
      if moves[w].value>val then
       begin
          hisx:=moves[w].xmove;
          hisy:=moves[w].ymove;
          val:=moves[w].value;
       end;
      board[hisx,hisy]:=2;
end;
{-----------------------------------MAIN}
begin
    textcolor(7);
    init(board);
    won:=false;
    clrscr;
    writeln('Who goes first? Player or computer?');
    readln(first);
    if first='computer' then board[10,10]:=2;
    clrscr;
    print(board);
    textcolor(2);
    if first='computer' then
    writeln('My move was: hor=10 vert=10');
    textcolor(7);
    repeat
      move(board,movex,movey);
      won:=win(board,movex,movey,1,3);
      clrscr;
      if not won then
      print(board);
      if won=true then
         who:=1
      else
       begin
         writeln('Hold on, I''m thinking...');
         comp(board,movex,movey,hisx,hisy);
         won:=win(board,hisx,hisy,2,3);
         if won=true then who:=2;
       end;
     clrscr;
     print(board);
     textcolor(2);
     writeln('My move was: hor=',hisx:1,' vert=',hisy:1);
     textcolor(7);
    until won;
    if who=1 then
    writeln('YOU WIN!')
    else
    writeln('I WIN!');
end.