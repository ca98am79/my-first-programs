program mines(input,output);
const
  bell=#$7;
var
  f,ey,b,c,x,g,y,j,k:integer;
  d,u:char;
  key,done:boolean;
{--------------------------wway?----}
procedure wway(d:char;
              var x,y:integer);
begin
   if d='8' then y:=y-1
   else if d='2' then y:=y+1
   else if d='4' then x:=x-1
   else if d='6' then x:=x+1
   else if d='7' then begin x:=x-1; y:=y-1; end
   else if d='9' then begin x:=x+1; y:=y-1; end
   else if d='1' then begin x:=x-1; y:=y+1; end
   else if d='3' then begin x:=x+1; y:=y+1; end;
   if x>79 then x:=79;
   if y>25 then y:=25;
   if x<2 then x:=2;
   if y<2 then y:=2;
 end;
 {---------------------this}
 procedure this(var b,c,x,y:integer;
                var key:boolean);
begin
    b:=x;
    c:=y;
    j:=x; k:=y;
    if (x=35) and ((y<15) and (y>9)) then x:=b;
    if (y=10) and ((x<44) and (x>34)) then y:=c;
    if (x=35) and (y=14) then y:=c;
    if (y=10) and (x=43) then x:=b;
    if (x=2) and ((y=2) and (key=false)) then begin key:=true; write(bell); end;
    if (x=43) and ((y<14) and (y>10)) then x:=b;
    if (y=14) and ((x<44) and (x>35)) then y:=c;
    if (x=43) and (y=14) then y:=c;
    if (y=14) and (x=43) then x:=b;
    if (y=13) and (x=43) then x:=b;
    if (j=37) and ((k=14) and (key=true)) then begin x:=j; y:=k; end;
    if (x=40) and (y=13) then begin gotoxy(2,1); writeln('YOU DID IT!!!!!'); end;
 end;
 {------------------------MAIN}
 begin
  writeln('Try to get the treasure!!!');
  read(kbd,u);
  f:=2;
  key:=false;
  g:=0;
  ey:=2;
  textbackground(3);
  textcolor(15);
  clrscr;
  gotoxy(2,2);
  write('.');
  gotoxy(35,10);
  write('+');
  gotoxy(36,10); write('-'); gotoxy(37,10); write('-');
  gotoxy(38,10); write('-'); gotoxy(39,10); write('-');
  gotoxy(40,10); write('-'); gotoxy(41,10); write('-');
  gotoxy(42,10); write('-'); gotoxy(43,10); write('+');
  gotoxy(35,11);
  write('|');
  gotoxy(36,14); write('-'); gotoxy(37,14); write('-');
  gotoxy(38,14); write('-'); gotoxy(39,14); write('-');
  gotoxy(40,14); write('-'); gotoxy(41,14); write('-');
  gotoxy(42,14); write('-'); gotoxy(43,14); write('+');
  gotoxy(43,13); write('|'); gotoxy(43,12); write('|');
  gotoxy(43,11); write('|');
  gotoxy(35,12);
  write('|');
  gotoxy(35,13);
  write('|');
  gotoxy(35,14);
  write('+');
  gotoxy(40,13);
  write('$');
  x:=75;
  y:=24;
  gotoxy(x,y);
  write('@');
  while d<>'q' do begin
    read(kbd,d);
    gotoxy(x,y);
    write(' ');
    g:=g+1;
    wway(d,x,y);
    this(b,c,x,y,key);
   write(g);
    gotoxy(x,y);
    write('@');
  end;
end.
