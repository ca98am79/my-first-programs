program chess(input,output);
{$I sprites.lib}
{$I blank.inc}
{$I graph.p}
{$I chess.inc}
type
   rank=array [1..8] of integer;
   boardtype=array [1..8] of rank;
   turntype=packed array [1..5] of char;
var
   turn:turntype;
   board:boardtype;
   turnc,turnr,turntoc,sub,turntor:integer;
   x,y:integer;
   legal,checkmate,check:boolean;
{-------------------------------------printpiece}
procedure printpiece(x,y,p:integer);
begin
  if p=1 then begin
   move(wpawn,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=2 then begin
  move(wbishop,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=3 then begin
  move(wknight,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=4 then begin
  move(wrook,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=5 then begin
  move(wqueen,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=6 then begin
  move(wking,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=7 then begin
  move(bpawn,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=8 then begin
  move(bbishop,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=9 then begin
  move(bknight,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=10 then begin
  move(brook,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=11 then begin
  move(bqueen,sprite,128);
   putspritec(x*30,y*22);
   end
  else if p=12 then begin
  move(bking,sprite,128);
  putspritec(x*30,y*22);
  end;
end;
{-------------------------------------printboard}
procedure printboard(board:boardtype);
var x,y:integer;
begin
  for x:=1 to 8 do
  begin
    for y:=1 to 8 do
    begin
       if board[x,y]<>0 then
          printpiece(x,y,board[x,y]);
    end;
  end;
end;
{------------------------------------drawboard}
procedure drawboard;
begin
   graphbackground(1);
   draw(15,5,260,5,3);
   draw(15,190,260,190,3);
   draw(15,190,15,5,3);
   draw(260,190,260,5,3);
   draw(15,165,260,165,3);
   draw(15,143,260,143,3);
   draw(15,121,260,121,3);
   draw(15,99,260,99,3);
   draw(15,77,260,77,3);
   draw(15,55,260,55,3);
   draw(15,33,260,33,3);
   draw(45,190,45,5,3);
   draw(75,190,75,5,3);
   draw(105,190,105,5,3);
   draw(135,190,135,5,3);
   draw(165,190,165,5,3);
   draw(195,190,195,5,3);
   draw(225,190,225,5,3);
   fillshape(55,180,3,3);
   fillshape(115,180,3,3);
   fillshape(175,180,3,3);
   fillshape(235,180,3,3);
   fillshape(30,160,3,3);
   fillshape(95,160,3,3);
   fillshape(145,160,3,3);
   fillshape(200,160,3,3);
   fillshape(55,140,3,3);
   fillshape(115,140,3,3);
   fillshape(175,140,3,3);
   fillshape(235,140,3,3);
   fillshape(30,120,3,3);
   fillshape(95,120,3,3);
   fillshape(145,120,3,3);
   fillshape(200,120,3,3);
   fillshape(55,90,3,3);
   fillshape(115,90,3,3);
   fillshape(175,90,3,3);
   fillshape(235,90,3,3);
   fillshape(30,70,3,3);
   fillshape(95,70,3,3);
   fillshape(145,70,3,3);
   fillshape(200,70,3,3);
   fillshape(55,50,3,3);
   fillshape(115,50,3,3);
   fillshape(175,50,3,3);
   fillshape(235,50,3,3);
   fillshape(30,30,3,3);
   fillshape(95,30,3,3);
   fillshape(145,30,3,3);
   fillshape(200,30,3,3);
   gotoxy(1,3); write('8');
   gotoxy(1,6); write('7');
   gotoxy(1,9); write('6');
   gotoxy(1,12); write('5');
   gotoxy(1,15); write('4');
   gotoxy(1,18); write('3');
   gotoxy(1,21); write('2');
   gotoxy(1,24); write('1');
   gotoxy(4,25); write('a');
   gotoxy(8,25); write('b');
   gotoxy(12,25); write('c');
   gotoxy(15,25); write('d');
   gotoxy(19,25); write('e');
   gotoxy(23,25); write('f');
   gotoxy(27,25); write('g');
   gotoxy(31,25); write('h');
end;
{------------------------------------getstuff}
procedure getstuff(turn:turntype;
                   var turnc,turnr,turntoc,turntor:integer);
begin
   turnc:=ord(turn[1])-96;
   turnr:=9-(ord(turn[2])-48);
   turntoc:=ord(turn[4])-96;
   turntor:=9-(ord(turn[5])-48);
end;
{-------------------------------------ifpawn}
procedure ifpawn(turnr,turnc,turntoc,turntor:integer;
                 var legal:boolean;
                 board:boardtype);
begin
   if turnc=turntoc then
   begin
      if (turntor=turnr-1) and (board[turnc,turntor]=0) then legal:=true
      else if (turntor=turnr-2) and (turnr=7) and (board[turnc,turntor-1]=0) then legal:=true;
   end
   else if (turnc=turntoc+1) or (turnc=turntoc-1) then
   begin
     if turnr=turntor+1 then
     begin
     if board[turntoc,turntor]>6 then legal:=true;
     end;
   end;
end;
{-----------------------------------ifbishop}
procedure ifbishop(turnr,turnc,turntoc,turntor:integer;
                 var legal:boolean;
                 board:boardtype);
var x,y,b:integer;
begin
   b:=0;
   if (board[turntoc,turntor]>6) or (board[turntoc,turntor]=0) then begin
      if (turnr<>turntor) and (turnc<>turntoc) then
      begin
        for x:=1 to 8 do
        begin
          if (turnr+x=turntor) and (turnc+x=turntoc) then b:=1
          else if (turnr-x=turntor) and (turnc-x=turntoc) then b:=1
          else if (turnr-x=turntor) and (turnc+x=turntoc) then b:=1
          else if (turnr+x=turntor) and (turnc-x=turntoc) then b:=1;
        end;
        if b=1 then
        begin
          if (turntor>turnr) and (turntoc>turnc) then begin
            for x:=1 to (turntoc-(turnc+1)) do
              if board[turntoc-x,turntor-x]<>0 then b:=5;
          end
          else if (turntor>turnr) and (turntoc<turnc) then begin
             for x:=1 to (turnc-(turntoc+1)) do
               if board[turntoc+x,turntor-x]<>0 then b:=5;
          end
          else if (turntor<turnr) and (turntoc<turnc) then begin
             for x:=1 to (turnc-(turntoc+1)) do
               if board[turntoc+x,turntor+x]<>0 then b:=5;
          end
          else if (turntor<turnr) and (turntoc>turnc) then begin
             for x:=1 to (turntoc-(turnc+1)) do
               if board[turntoc-x,turntor+x]<>0 then b:=5;
          end;
       if (b<>5) and (b<>0) then legal:=true;
    end;
  end;
  end;
end;
{-----------------------------------ifknight}
procedure ifknight(turnr,turnc,turntoc,turntor:integer;
                 var legal:boolean;
                 board:boardtype);
begin
if (board[turntoc,turntor]>6) or (board[turntoc,turntor]=0) then begin
  if (turnr=turntor+2) and ((turnc=turntoc-1) or (turnc=turntoc+1)) then legal:=true
  else if (turnr=turntor-2) and ((turnc=turntoc-1) or (turnc=turntoc+1)) then legal:=true
  else if (turnc=turntoc-2) and ((turnr=turntor-1) or (turnr=turntor+1)) then legal:=true
  else if (turnc=turntoc+2) and ((turnr=turntor-1) or (turnr=turntor+1)) then legal:=true;
 end;
end;
{-----------------------------------ifrook}
procedure ifrook(turnr,turnc,turntoc,turntor:integer;
                 var legal:boolean;
                 board:boardtype);
var
   a,b:integer;
begin
   b:=0;
   if turnc=turntoc then
   begin
     if (turnr=turntor-1) and ((board[turnc,turntor]>6) or (board[turnc,turntor]=0)) then legal:=true;
     if turntor<turnr then
     begin
     for a:=turnr-1 downto turntor+1 do
       if board[turnc,a]<>0 then b:=1;
     if b=0 then
     begin
        if board[turnc,turntor]=0 then legal:=true
        else if board[turnc,turntor]>6 then legal:=true;
     end;
     end;
     b:=0;
     if turntor>turnr then
     begin
     for a:=turntor-1 to turnr+1 do
        if board[turnc,a]<>0 then b:=1;
     if b=0 then
     begin
        if board[turnc,turntor]=0 then legal:=true
        else if board[turnc,turntor]>6 then legal:=true;
     end;
     end;
   end
   else if turnr=turntor then
   begin
   if (turnc=turntoc-1) and ((board[turntoc,turnr]>6) or (board[turntoc,turnr]=0)) then legal:=true;
   b:=0;
   if turntoc<turnc then
   begin
     for a:=turnc-1 downto turntoc+1 do
       if board[a,turnr]<>0 then b:=1;
     if b=0 then
     begin
        if board[turntoc,turnr]=0 then legal:=true
        else if board[turntoc,turnr]>6 then legal:=true;
     end;
     end;
     b:=0;
     if turntoc>turnc then
     begin
     for a:=turntoc-1 to turnc+1 do
        if board[a,turnr]<>0 then b:=1;
     if b=0 then
     begin
        if board[turntoc,turnr]=0 then legal:=true
        else if board[turntoc,turnr]>6 then legal:=true;
     end;
     end;
   end;
end;
{-----------------------------------if queen}
procedure ifqueen(turnr,turnc,turntoc,turntor:integer;
                 var legal:boolean;
                 board:boardtype);
begin
  ifrook(turnr,turnc,turntoc,turntor,legal,board);
  ifbishop(turnr,turnc,turntoc,turntor,legal,board);
end;
{-----------------------------------ifking}
procedure ifking(turnr,turnc,turntoc,turntor:integer;
                 var legal:boolean;
                 board:boardtype);
begin
  if (board[turntoc,turntor]>6) or (board[turntoc,turntor]=0) then
  begin
     if (turnc=turntoc+1) and ((turnr=turntor) or ((turnr=turntor-1) or (turnr=turntor+1))) then legal:=true
     else if (turnc=turntoc-1) and ((turnr=turntor) or ((turnr=turntor-1) or (turnr=turntor+1))) then legal:=true
     else if (turnc=turntoc) and ((turnr=turntor+1) or (turnr=turntor-1)) then legal:=true;
  end;
end;
{-------------------------------------blackmoves}
procedure blackmoves(var board:boardtype);
var
  a,b,c:integer;
begin
   a:=random(6)+7;
   repeat
      b:=random(8)+1;
      c:=random(8)+1;
   until board[b,c]>6;
   a:=board[b,c];
   if a=7 then
    begin
      if ((board[b+1,c+1]<7) and (board[b+1,c+1]>0)) then begin
      board[b,c]:=0; if (b+c) mod 2=0 then fillshape(b*30,c*22,3,3)
      else begin move(blank,sprite,128);
      putspritec(b*30,c*22); fillshape(b*30,c*22,0,0); end; board[b+1,c+1]:=a;
      end
      else if ((board[b-1,c+1]<7) and (board[b-1,c+1]>0)) then begin
      board[b,c]:=0; if (b+c) mod 2=0 then fillshape(b*30,c*22,3,3)
      else begin move(blank,sprite,128);
      putspritec(b*30,c*22); fillshape(b*30,c*22,0,0); end; board[b-1,c+1]:=a;
      end
      else if (board[b,c+1]<>0) then blackmoves(board)
      else begin
      board[b,c]:=0; if (b+c) mod 2=0 then fillshape(b*30,c*22,3,3)
      else begin move(blank,sprite,128);
      putspritec(b*30,c*22); fillshape(b*30,c*22,0,0); end; board[b,c+1]:=a;
      end;
    end
    else if a=9 then
     begin
      if (board[b-2,c+1]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b-2,c+1]:=a;
      end
      else if (board[b-2,c-1]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b-2,c-1]:=a;
      end
      else if (board[b+2,c+1]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b+2,c+1]:=a;
      end
      else if (board[b+2,c-1]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b+2,c-1]:=a;
      end
      else if (board[b-1,c+2]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b-1,c+2]:=a;
      end
      else if (board[b-1,c-2]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b-1,c-2]:=a;
      end
      else if (board[b+1,c-2]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b+1,c-2]:=a;
      end
      else if (board[b+1,c+2]<7) then begin board[b,c]:=0; if (b+c) mod 2=0 then
        fillshape(b*30,c*22,3,3)
        else begin move(blank,sprite,128); putspritec(b*30,c*22);
        fillshape(b*30,c*22,0,0); end; board[b+1,c+2]:=a;
      end
      else blackmoves(board);
   end
   else blackmoves(board);
end;
{-------------------------------------MAIN}
begin
   for x:=1 to 8 do
   begin
      for y:=1 to 8 do
      begin
         board[x,y]:=0;
      end;
   end;
   for x:=1 to 8 do
     board[x,2]:=7;
   for x:=1 to 8 do
     board[x,7]:=1;
   board[1,1]:=10;
   board[2,1]:=9;
   board[3,1]:=8;
   board[4,1]:=11;
   board[5,1]:=12;
   board[6,1]:=8;
   board[7,1]:=9;
   board[8,1]:=10;
   board[1,8]:=4;
   board[2,8]:=3;
   board[3,8]:=2;
   board[4,8]:=5;
   board[5,8]:=6;
   board[6,8]:=2;
   board[7,8]:=3;
   board[8,8]:=4;
   graphcolormode;
   palette(3);
   drawboard;
   repeat
      printboard(board);
      gotoxy(75,15);
      legal:=false;
      write('Move?');
      gotoxy(75,16);
      write('       ');
      gotoxy(75,16);
      readln(turn);
      getstuff(turn,turnc,turnr,turntoc,turntor);
      if board[turnc,turnr]=1 then ifpawn(turnr,turnc,turntoc,turntor,legal,board)
      else if board[turnc,turnr]=2 then ifbishop(turnr,turnc,turntoc,turntor,legal,board)
      else if board[turnc,turnr]=3 then ifknight(turnr,turnc,turntoc,turntor,legal,board)
      else if board[turnc,turnr]=4 then ifrook(turnr,turnc,turntoc,turntor,legal,board)
      else if board[turnc,turnr]=5 then ifqueen(turnr,turnc,turntoc,turntor,legal,board)
      else if board[turnc,turnr]=6 then ifking(turnr,turnc,turntoc,turntor,legal,board);
      if legal=true then begin
      sub:=board[turnc,turnr];
      board[turnc,turnr]:=0;
      move(blank,sprite,128);
      putspritec(turnc*30,turnr*22);
      if (turnc+turnr) mod 2=0 then
      fillshape(turnc*30,turnr*22,3,3)
      else fillshape(turnc*30,turnr*22,0,0);
      board[turntoc,turntor]:=sub;
      blackmoves(board);
      end;
   until checkmate=true;
end.


