program chess(input,output);
{---------------------------}
{}                         {}
{}     {MIKE CARSON}       {}
{}       {8-16-92}         {}
{}                         {}
{---------------------------}
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
   z,x,y,jj,kk,ex,why:integer;
   where:char;
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
      else if (turntor=turnr-2) and (turnr=7) and ((board[turnc,turnr-1]=0) and (board[turnc,turnr-2]=0)) then
      legal:=true;
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
{-------------------------------------ifpawnb}
procedure ifpawnb(c,b,d,e:integer;
                 var legal:boolean;
                 board:boardtype);
begin
   if b=d then
   begin
      if (e=c+1) and (board[b,e]=0) then legal:=true
      else if (e=c+2) and (c=2) and ((board[b,c+1]=0) and (board[b,c+2]=0)) then legal:=true;
   end
   else if (b=d+1) or (b=d-1) then
   begin
     if c=e-1 then
     begin
     if (board[d,e]<7) and (board[d,e]>0) then legal:=true;
     end;
   end;
end;
{-----------------------------------ifbishopb}
procedure ifbishopb(c,b,d,e:integer;
                 var legal:boolean;
                 board:boardtype);
var x,xx,y:integer;
begin
   xx:=0;
   if (board[d,e]<7) then begin
      if (c<>e) and (b<>d) then
      begin
        for x:=1 to 8 do
        begin
          if (c+x=e) and (b+x=d) then xx:=1
          else if (c-x=e) and (b-x=d) then xx:=1
          else if (c-x=e) and (b+x=d) then xx:=1
          else if (c+x=e) and (b-x=d) then xx:=1;
        end;
        if xx=1 then
        begin
          if (e>c) and (d>b) then begin
            for x:=1 to (d-(b+1)) do
              if board[d-x,e-x]<>0 then xx:=5;
          end
          else if (e>c) and (d<b) then begin
             for x:=1 to (b-(d+1)) do
               if board[d+x,e-x]<>0 then xx:=5;
          end
          else if (e<c) and (d<b) then begin
             for x:=1 to (b-(d+1)) do
               if board[d+x,e+x]<>0 then xx:=5;
          end
          else if (e<c) and (d>b) then begin
             for x:=1 to (d-(b+1)) do
               if board[d-x,e+x]<>0 then xx:=5;
          end;
       if (xx<>5) and (xx<>0) then legal:=true;
    end;
  end;
  end;
end;
{-----------------------------------ifknightb}
procedure ifknightb(c,b,d,e:integer;
                 var legal:boolean;
                 board:boardtype);
begin
if (board[d,e]<7) then begin
  if (c=e+2) and ((b=d-1) or (b=d+1)) then legal:=true
  else if (c=e-2) and ((b=d-1) or (b=d+1)) then legal:=true
  else if (b=d-2) and ((c=e-1) or (c=e+1)) then legal:=true
  else if (b=d+2) and ((c=e-1) or (c=e+1)) then legal:=true;
 end;
end;
{-----------------------------------ifrookb}
procedure ifrookb(c,b,d,e:integer;
                 var legal:boolean;
                 board:boardtype);
var
   a,xx:integer;
begin
   legal:=false;
   xx:=0;
   if b=d then
   begin
     if (c=e-1) and (board[b,e]<7) then legal:=true;
     if e<c then
     begin
     for a:=c-1 downto e+1 do
       if board[b,a]<>0 then xx:=1;
     if xx=0 then
     begin
        if board[b,e]=0 then legal:=true
        else if board[b,e]<7 then legal:=true;
     end;
     end;
     xx:=0;
     if e>c then
     begin
     for a:=c+1 to e-1 do
        if board[b,a]<>0 then xx:=1;
     if xx=0 then
     begin
        if board[b,e]=0 then legal:=true
        else if board[b,e]<7 then legal:=true;
     end;
     end;
   end
   else if c=e then
   begin
   if (b=d-1) and (board[d,c]<7) then legal:=true;
   xx:=0;
   if d<b then
   begin
     for a:=d+1 to b-1 do
       if board[a,c]<>0 then xx:=1;
     if xx=0 then
     begin
     gotoxy(30,10);
        if board[d,c]=0 then legal:=true
        else if board[d,c]<7 then legal:=true;
     end;
     end;
     xx:=0;
     if d>b then
     begin
     for a:=d-1 downto b+1 do
        if board[a,c]<>0 then xx:=1;
     if xx=0 then
     begin
        gotoxy(40,5);
        if board[d,c]=0 then legal:=true
        else if board[d,c]<7 then legal:=true;
     end;
     end;
   end;
end;
{-----------------------------------if queenb}
procedure ifqueenb(c,b,d,e:integer;
                 var legal:boolean;
                 board:boardtype);
begin
  ifrookb(c,b,d,e,legal,board);
  ifbishopb(c,b,d,e,legal,board);
end;
{-------------------------------------ifcheckb}
procedure ifcheckb(var board:boardtype;
                   var ch1,ch2,mm,nn:integer;
                   var check:boolean;
                   var where:char);
var z,y:integer;
begin
   z:=0;
   gotoxy(75,9);
   y:=0;
   check:=false;
   if ((board[mm-1,nn+1]=1) or (board[mm+1,nn+1]=1)) then check:=true;
     while z<8 do
     begin
       z:=z+1;
       while y<8 do
        begin
         y:=y+1;
         if (board[z,y]<7) and (board[z,y]>0) then
         begin
         if board[z,y]=2 then ifbishop(y,z,mm,nn,check,board)
         else if board[z,y]=3 then ifknight(y,z,mm,nn,check,board)
         else if board[z,y]=4 then ifrook(y,z,mm,nn,check,board)
         else if board[z,y]=5 then ifqueen(y,z,mm,nn,check,board);
         if check=true then begin ch1:=z; ch2:=y; y:=10; z:=10; end;
         end;
        end;
        if check<>true then y:=0;
      end;
end;
{-----------------------------------ifblock}
procedure ifblock(var board:boardtype;
                  var where:char;
                  var ch1,ch2,c,b,d,e:integer;
                  var check:boolean);
var block,can:boolean;
    fake:boardtype;
    samantha:char;
    cc,aa,rr,ss,oo,die,die2,mike,carson:integer;
begin
    rr:=0;
    block:=true;
    can:=false;
    if board[ch1,ch2]=3 then begin write('CHECKMATE'); halt; end
    else if board[ch1,ch2]=1 then begin write('CHECKMATE'); halt; end
    else
     begin
        if ch1=b then
        {-------------------same column}
          begin
          for mike:=1 to 8 do
           for carson:=1 to 8 do fake[mike,carson]:=board[mike,carson];
           repeat
            repeat
              cc:=random(8)+1;
              aa:=random(8)+1;
            until (board[cc,aa]>7) and (board[cc,aa]<12);
            ss:=board[cc,aa];
            while rr<9 do
              begin
               rr:=rr+1;
               if ss=8 then ifbishopb(aa,cc,ch1,rr,can,board)
               else if ss=9 then ifknightb(aa,cc,ch1,rr,can,board)
               else if ss=10 then ifrookb(aa,cc,ch1,rr,can,board)
               else if ss=11 then ifqueenb(aa,cc,ch1,rr,can,board);
               gotoxy(75,10);
               if can=true then begin
               fake[cc,aa]:=0;
               fake[ch1,rr]:=ss;
               ifcheckb(fake,ch1,ch2,d,e,block,where);
               if block{ed}=false then begin
                b:=cc;
                c:=aa;
                check:=false;
                d:=ch1;
                e:=rr;
                rr:=997;
               end
               else begin fake[cc,aa]:=ss; fake[ch1,rr]:=0; end;
              end;
              end;
           until block=false;
          end
         else if ch2=c then
       { -------------------same rank}
          begin
          for mike:=1 to 8 do
           for carson:=1 to 8 do fake[mike,carson]:=board[mike,carson];
           repeat
            repeat
              cc:=random(8)+1;
              aa:=random(8)+1;
            until (board[cc,aa]>7) and (board[cc,aa]<12);
            ss:=board[cc,aa];
            while rr<9 do
              begin
               rr:=rr+1;
               if ss=8 then ifbishopb(aa,cc,rr,ch2,can,board)
               else if ss=9 then ifknightb(aa,cc,rr,ch2,can,board)
               else if ss=10 then ifrookb(aa,cc,rr,ch2,can,board)
               else if ss=11 then ifqueenb(aa,cc,rr,ch2,can,board);
               gotoxy(75,10);
               if can=true then begin
               fake[cc,aa]:=0;
               fake[rr,ch2]:=ss;
               ifcheckb(fake,ch1,ch2,d,e,block,where);
               if block{ed}=false then begin
                b:=cc;
                c:=aa;
                check:=false;
                d:=rr;
                e:=ch2;
                rr:=997;
               end
               else begin fake[cc,aa]:=ss; fake[rr,ch2]:=0; end;
              end;
              end;
           until block=false;
          end
        {else
        -------------------diagnols
          begin
          end;}
      end;
end;
{-----------------------------------ifkingb}
procedure ifkingb(var ch1,ch2,c,b,d,e:integer;
                 var legal:boolean;
                 var board:boardtype;
                 var where:char);
var check:boolean;
    die,die2:integer;
begin
  if (board[d,e]<7) then
  begin
     ifcheckb(board,die,die2,d,e,check,where);
     if ord(where)<160 then where:=succ(where);
     if ord(where)>150 then ifblock(board,where,ch1,ch2,c,b,d,e,check);
     if check=false then
     begin
     if board[b,c]=12 then begin
      if (b=d+1) and ((c=e) or ((c=e-1) or (c=e+1))) then legal:=true
      else if (b=d-1) and ((c=e) or ((c=e-1) or (c=e+1))) then legal:=true
      else if (b=d) and ((c=e+1) or (c=e-1)) then legal:=true;
     end
     else legal:=true;
     end;
  end;
end;
 {-------------------------------------blackmoves}
procedure blackmoves(var where:char;
                     var board:boardtype;
                     var legal:boolean);
var
  a,b,c,d,e,z,y,mm,nn,ch1,ch2:integer;
  ch:char;
  check:boolean;
begin
   gotoxy(75,21);
   write('COMP.');
   gotoxy(75,23);
   write('     ');
   legal:=false;
   repeat
      b:=random(8)+1;
      c:=random(8)+1;
   until board[b,c]>6;
   repeat
      d:=random(8)+1;
      e:=random(8)+1;
   until board[d,e]<7;
   for z:=1 to 8 do
   begin
     for y:=1 to 8 do
     begin
       if board[z,y]=12 then begin
       mm:=z; nn:=y;
       end;
     end;
   end;
  ifcheckb(board,ch1,ch2,mm,nn,check,where);
   if check=true then begin
     gotoxy(75,1);
     write('CHECK');
     b:=mm; c:=nn;
     repeat
       d:=random(8)+1;
       e:=random(8)+1;
     until board[d,e]<7;
   end;
   a:=board[b,c];
   if a=7 then
    begin
      legal:=false;
      ifpawnb(c,b,d,e,legal,board);
      if legal=true then begin
      board[b,c]:=0;
      move(blank,sprite,128);
      putspritec(b*30,c*22);
      if (b+c) mod 2=0 then
      fillshape(b*30,c*22,3,3)
      else fillshape(b*30,c*22,0,0);
      board[d,e]:=a;
      gotoxy(75,23);
      write(chr(b+96):1,9-c:1,'-',chr(d+96):1,9-e:1);
      end
      else blackmoves(where,board,legal);
    end
   else if a=8 then
    begin
      legal:=false;
      ifbishopb(c,b,d,e,legal,board);
      if legal=true then begin
      board[b,c]:=0;
      move(blank,sprite,128);
      putspritec(b*30,c*22);
      if (b+c) mod 2=0 then
      fillshape(b*30,c*22,3,3)
      else fillshape(b*30,c*22,0,0);
      board[d,e]:=a;
      gotoxy(75,23);
      write(chr(b+96):1,9-c:1,'-',chr(d+96):1,9-e:1);
      end
      else blackmoves(where,board,legal);
    end
    else if a=9 then
    begin
      legal:=false;
      ifknightb(c,b,d,e,legal,board);
      if legal=true then begin
      board[b,c]:=0;
      move(blank,sprite,128);
      putspritec(b*30,c*22);
      if (b+c) mod 2=0 then
      fillshape(b*30,c*22,3,3)
      else fillshape(b*30,c*22,0,0);
      board[d,e]:=a;
      gotoxy(75,23);
      write(chr(b+96):1,9-c:1,'-',chr(d+96):1,9-e:1);
      end
      else blackmoves(where,board,legal);
    end
    else if a=10 then
    begin
      legal:=false;
      ifrookb(c,b,d,e,legal,board);
      if legal=true then begin
      board[b,c]:=0;
      move(blank,sprite,128);
      putspritec(b*30,c*22);
      if (b+c) mod 2=0 then
      fillshape(b*30,c*22,3,3)
      else fillshape(b*30,c*22,0,0);
      board[d,e]:=a;
      gotoxy(75,23);
      write(chr(b+96):1,9-c:1,'-',chr(d+96):1,9-e:1);
      end
      else blackmoves(where,board,legal);
    end
    else if a=11 then
    begin
      legal:=false;
      ifqueenb(c,b,d,e,legal,board);
      if legal=true then begin
      board[b,c]:=0;
      move(blank,sprite,128);
      putspritec(b*30,c*22);
      if (b+c) mod 2=0 then
      fillshape(b*30,c*22,3,3)
      else fillshape(b*30,c*22,0,0);
      board[d,e]:=a;
      gotoxy(75,23);
      write(chr(b+96):1,9-c:1,'-',chr(d+96):1,9-e:1);
      end
      else blackmoves(where,board,legal);
    end
    else if a=12 then
    begin
      legal:=false;
      ifkingb(ch1,ch2,c,b,d,e,legal,board,where);
      if legal=true then begin
      a:=board[b,c];
      board[b,c]:=0;
      move(blank,sprite,128);
      putspritec(b*30,c*22);
      if (b+c) mod 2=0 then
      fillshape(b*30,c*22,3,3)
      else fillshape(b*30,c*22,0,0);
      board[d,e]:=a;
      gotoxy(75,23);
      write(chr(b+96):1,9-c:1,'-',chr(d+96):1,9-e:1);
      end
      else blackmoves(where,board,legal);
    end
    else blackmoves(where,board,legal);
end;
{-------------------------------------promote}
procedure promote(var board:boardtype;
                      sub:integer);
var
  pro:char;
begin
gotoxy(73,5);
write('Promote');
gotoxy(73,6);
write(' to ?');
gotoxy(73,7);
write('q,b,n,r');
gotoxy(74,8);
read(pro);
gotoxy(73,5);
write('       ');
gotoxy(73,6);
write('        ');
gotoxy(73,7);
write('         ');
gotoxy(73,8);
write('       ');
draw(260,190,260,5,3);
if pro='q' then board[sub,1]:=5
else if pro='b' then board[sub,1]:=2
else if pro='n' then board[sub,1]:=3
else if pro='r' then board[sub,1]:=4
else promote(board,sub);
end;
{-------------------------------------promoteb}
procedure promoteb(var board:boardtype;
                      sub:integer);
var
  pro:char;
begin
  board[sub,8]:=11;
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
   ex:=5; why:=5;
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
      where:='a';
      gotoxy(75,1);
      write('      ');
      printboard(board);
      legal:=false;
      gotoxy(75,15);
      write('Move?');
      gotoxy(75,16);
      write('      ');
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
      printboard(board);
      legal:=false;
      for jj:=1 to 8 do
        if board[jj,1]=1 then promote(board,jj);
      for jj:=1 to 8 do
        if board[jj,8]=7 then promoteb(board,jj);
      blackmoves(where,board,legal);
      end;
      ex:=0;
      why:=0;
      for x:=1 to 8 do
       for jj:=1 to 8 do
         begin
           if board[x,jj]=6 then ex:=5
           else if board[x,jj]=12 then why:=5;
         end;
   until (ex=0) or (why=0);
   if ex=0 then writeln('         I WIN')
   else if why=0 then writeln('            YOU WIN');
end.


