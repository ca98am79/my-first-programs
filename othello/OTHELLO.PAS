program othello(input,output);
type
   boardtype=array [1..10,1..10] of integer;
var
   board:boardtype;
   ch:char;
   player,xmove,ymove:integer;
{---------------------------------------------------INITBOARD}
procedure initboard(var board:boardtype);
var x,y:integer;
begin
   for x:=1 to 10 do
      for y:=1 to 10 do
         board[x,y]:=0;
   board[5,5]:=1;
   board[6,5]:=2;
   board[5,6]:=2;
   board[6,6]:=1;
end;
{---------------------------------------------------PRINTBOARD}
procedure printboard(board:boardtype);
var x,y:integer;
begin
   for y:=1 to 10 do
    begin
      if y<>10 then write(y:2) else write(y:1);
      for x:=1 to 10 do
      begin
        if board[x,y]=1 then
           write(' * ')
        else if board[x,y]=2 then
           write(' O ')
        else
           write(' . ')
      end;
      writeln;
    end;
   write(' ');
   for x:=1 to 10 do
      write('  ',x:1);
   writeln;
end;
{---------------------------------------------------FINDSCORE}
procedure FindScore(board:boardtype);
var x,y,play1,play2:integer;
begin
   writeln;
   play1:=0;
   play2:=0;
   for x:=1 to 10 do
      for y:=1 to 10 do
         if board[x,y]=1 then
            play1:=play1+1
         else if board[x,y]=2 then
            play2:=play2+1;
   writeln('Player 1 ended up with ',play1:1,' points.');
   writeln('Player 2 ended up with ',play2:1,' points.');
   writeln;
   if play1=play2 then
      writeln('You tied.')
   else if play1>play2 then
      writeln('Player 1 wins.')
   else
      writeln('Player 2 wins.');
end;
{---------------------------------------------------OCCUPIED}
function occupied(xmove,ymove:integer;
                  board:boardtype):boolean;
begin
   if board[xmove,ymove]=0 then
      occupied:=false
   else
      occupied:=true;
end;
{---------------------------------------------------LEGAL}
function  Legal(xmove,ymove:integer;
                color:integer;
                var board:boardtype):boolean;
var x,y:integer;
begin
   x:=xmove;
   legal:=false;
   repeat
     if x<>10 then x:=x+1;
   until (board[x,ymove]<>(color mod 2 +1)) or (x=10);
   if (board[x,ymove]=color) then legal:=true;
   x:=xmove;
   repeat
     if x<>1 then x:=x-1;
   until (board[x,ymove]<>(color mod 2+1)) or (x=1);
   if (board[x,ymove]=color) then legal:=true;
   y:=ymove;
   repeat
     if y<>10 then y:=y+1;
   until (board[xmove,y]<>(color mod 2+1)) or (y=10);
   if (board[xmove,y]=color) then legal:=true;
   y:=ymove;
   repeat
     if y<>1 then y:=y-1;
   until (board[xmove,y]<>(color mod 2+1)) or (y=1);
   if (board[xmove,y]=color) then legal:=true;
end;
{---------------------------------------------------MOVE}
procedure move(var board:boardtype;
               xmove,ymove,color:integer);
begin
end;
{---------------------------------------------------MAIN}
begin
   initboard(board);
   player:=1;
   repeat
      clrscr;
      printboard(board);
      writeln;
      if player=1 then writeln('Player one''s move. (*)')
      else writeln('Player two''s move. (O)');
      writeln('Type ''m'' to move, ''p'' to pass, or ''q'' to quit.');
      readln(ch);
      if (ch='m') or (ch='M') then
         begin
          repeat
            writeln('Enter x coordinate.');
            readln(xmove);
          until (xmove>0) and (xmove<11);
          repeat
            writeln('Enter y coordinate.');
            readln(ymove);
          until (ymove>0) and (ymove<11);
            if occupied(xmove,ymove,board) then
              begin
               writeln('Sorry, that space is occupied.');
               writeln('<press enter to continue>');
               readln(xmove);
               player:=(player mod 2)+1;
              end
            else
              if legal(xmove,ymove,player,board) then
                { move(board,xmove,ymove,player);} write('legal')
              else write('not legal');
         end;
      if (((ch='m') or (ch='M')) or ((ch='p') or (ch='P'))) then
         player:=(player mod 2) +1;
   until (ch='q') or (ch='Q');
   findscore(board);
end.