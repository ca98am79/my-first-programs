program blow(output);
{$I sprites.lib}
{$I mis.inc}
{$I killer.inc}
{$I costuff.inc}
{$I base.inc}
{$I blank.inc}
{$I movie.inc}
var num1,num2,num3,num4,x,y,xx,yy,
    a,b,c,i,j,nummis,k,lev,deaths:integer;
    direction:char;
{--------------------------------------------lost?}
procedure lost(var deaths,a,num1,num2,num3,num4:integer);
var i:integer;
begin
  for i:=-12 to 12 do
  begin
   if a+i=100 then
    begin
     if num1=0 then
      begin
       num1:=1;
       deaths:=deaths+1;
      end;
    end;
   if a+i=300 then
    begin
     if num2=0 then
      begin
       num2:=1;
       deaths:=deaths+1;
      end;
    end;
   if a+i=200 then
    begin
     if num3=0 then
      begin
       num3:=1;
       deaths:=deaths+1;
      end;
    end;
   if a+i=20 then
    begin
     if num4=0 then
      begin
       num4:=1;
       deaths:=deaths+1;
      end;
     end;
  end;
end;
{--------------------------------------------putbases}
procedure putbases;
begin
   move(base,sprite,128);
   putspritec(100,22);
   putspritec(200,22);
   putspritec(300,22);
   putspritec(20,22);
end;
{--------------------------------------------mmissle}
procedure mmissle(var x,y,a,lev:integer;
                  var d:char);
  var j,amt:integer;
       begin
         amt:=16;
        read(kbd,d);
        while not keypressed do
        begin
        a:=random(300);
        j:=0;
         while j<=60 do
            begin
               j:=j+1;
               changeguypos(x,y,a,j,d);
            end;
         move(explosion,sprite,128);
         putspritec(a,200-3*j);
         for k:=1 to 500 do
         move(blank,sprite,128);
         putspritec(a,200-3*j);
       end;
      end;
{---------------------------------- MAIN }
begin
   clrscr;
   graphcolormode;
   graphbackground(1);
   palette(2);
   putbases;
   lev:=3;
   deaths:=0;
   xx:=100; yy:=160;
   nummis:=random(13)+7;
   write('BASES:4');
   write('                    ');
   write('MISSLES:',nummis);
   a:=0;
   num1:=0; num2:=0; num3:=0; num4:=0;
   draw(1,15,300,15,white);
   while deaths<>4 do
    begin
        lost(deaths,a,num1,num2,num3,num4);
        gotoxy(1,1);
        write('BASES:',4-deaths); write('                    ');
        write('MISSLES:',nummis-c); write(' ');
        mmissle(xx,yy,a,lev,direction);
    end;
    writeln;
   if deaths>=4 then writeln('YOU LOST');
   if deaths<4 then writeln('YOU WON');
end.
