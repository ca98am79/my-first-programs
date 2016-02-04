program asteroids (input,ouput,outfile);
{$I sprites.lib}
{$I bonus.inc}
{$I mis.inc}
{$I space.inc}
{$I blank.inc}
const
   up=#$48; left=#$4b; right=#$4d; pgup=#$49; home=#$47;
   down=#$50; dleft=#$4f; pgdn=#$51;
type
   persontype=record
      name:string[30];
      score:integer;
      percent:real;
      lev:integer;
    end;
var yes:char;
{------------------------------------INSTRUCTIONS}
procedure instructions;
var b:char;
begin
writeln('Long, long ago, in a galaxy far, far away, there was');
writeln('a spacefighter that was supposed to bring groceries over');
writeln('to his grandmother''s planet.  On the way there, he was');
writeln('sucked into a black hole.  Asteroids and pieces of stuff');
writeln('were also being pulled into the small but forceful blackhole');
writeln('and he had to shoot them so they wouldn''t crush him.');
writeln('This is a game about that spacefighter.');
writeln;
writeln('Press the arrow keys to fire in that direction.  You');
writeln('try to destroy as many asteroids as you can before you');
writeln('are killed (which will happen), so that your score will ');
writeln('go up. (SCORE: the percent of shots that were hits plus');
writeln('the number of hits.)  The gravity level of the black hole');
writeln('gradually increases which will be noted on the top of your');
writeln('screen (1 is lowest). You can kill enemy spaceships (they');
writeln('have a "+5" on them) to add 5 points to your score, or you');
writeln('can kill, accidently, one of your own pals represented by');
writeln('a "-5" on them which will subtract 5 from your score.');
WRITELN('If your score is high enough, your starfighter will');
writeln('be placed on the HALL OF FAME FOR PEOPLE BEING SUCKED');
writeln('INTO BLACK HOLES AND SURVIVING A LITTLE WHILE.');
writeln;
writeln('GOOD LUCK, and may the force be with you...');
read(kbd,b);
end;
{------------------------DEMO}
{$I demo2.inc}
{------------------------TOPTEN}
{$I topten.dat}
{------------------------WHAT}
procedure what(var xxx,yy,sismol,tem,direct,x,y:integer);
begin
   if direct=7 then
    begin
      x:=0; y:=200;
    end
   else if direct=5 then
    begin
      tem:=random(2)+1;
      if tem=3 then tem:=2;
      sismol:=random(7)+1;
      if sismol=1 then begin
       xxx:=70; yy:=50; end
      else if sismol=2 then begin
       xxx:=160; yy:=50; end
      else if sismol=3 then begin
       xxx:=250; yy:=50; end
      else if sismol=4 then begin
       xxx:=70; yy:=100; end
      else if sismol=5 then begin
       xxx:=250; yy:=100; end
      else if sismol=6 then begin
       xxx:=70; yy:=150; end
      else if sismol=7 then begin
       xxx:=160; yy:=150; end
      else if sismol=8 then begin
       xxx:=250; yy:=150; end
    end
   else if direct=8 then
    begin
      x:=160; y:=200;
    end
   else if direct=9 then
    begin
      x:=320; y:=200;
    end
   else if direct=4 then
    begin
      x:=0; y:=100;
    end
   else if direct=6 then
    begin
      x:=320; y:=100;
    end
   else if direct=3 then
    begin
      x:=320; y:=0;
    end
   else if direct=2 then
    begin
      x:=160; y:=0;
    end
   else if direct=1 then
    begin
      x:=0; y:=0;
    end;
   if direct<>5 then tem:=77;
end;
{------------------------FIRE}
procedure firing(var xxx,yy,sismol,rshots,tem,hits,direct:integer;
                 var x,y:integer;
                 fire:char);
begin
     rshots:=rshots+1;
     if fire=up then begin
        if tem=77 then begin
         if (x=160) and (y<100) then
         begin
         hits:=hits+1;
         draw(160,90,x,y,white);
         move(explosion,sprite,128);
         putspritec(x,y);
         draw(160,90,x,y,black);
         move(blank,sprite,128);
         putspritec(x,y);
         direct:=random(8)+1;
         what(xxx,yy,sismol,tem,direct,x,y);
         end
         else
         begin
         draw(160,90,160,0,white);
         draw(160,90,160,0,black);
         end;
         end
        else if (tem<>77) and (sismol=2) then
             begin
             draw(160,90,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(160,90,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
       else if fire=down then begin
         if tem=77 then begin
           if (x=160) and (y>100) then
           begin
           hits:=hits+1;
           draw(160,110,x,y,white);
           move(explosion,sprite,128);
           putspritec(x,y);
           draw(160,110,x,y,black);
           move(blank,sprite,128);
           putspritec(x,y);
           direct:=random(8)+1;
         what(xxx,yy,sismol,tem,direct,x,y);
           end
           else
           begin
           draw(160,110,160,200,white);
           draw(160,110,160,200,black);
           end;
           end
         else if (tem<>77) and (sismol=7) then
             begin
             draw(160,110,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(160,110,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
     else if fire=left then begin
           if tem=77 then
            begin
             if (x<160) and (y=100) then
              begin
               hits:=hits+1;
               draw(150,100,x,y,white);
               move(explosion,sprite,128);
               putspritec(x,y);
               draw(150,100,x,y,black);
               move(blank,sprite,128);
               putspritec(x,y);
               direct:=random(8)+1;
               what(xxx,yy,sismol,tem,direct,x,y);
              end
             else
              begin
               draw(150,100,0,100,white);
               draw(150,100,0,100,black);
              end;
             end
            else if (tem<>77) and (sismol=4)  then
             begin
             draw(150,100,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(150,100,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
     else if fire=right then begin
          if tem=77 then begin
            if (x>160) and (y=100) then
            begin
            hits:=hits+1;
            draw(170,100,x,y,white);
            move(explosion,sprite,128);
            putspritec(x,y);
            draw(170,100,x,y,black);
            move(blank,sprite,128);
            putspritec(x,y);
            direct:=random(8)+1;
            what(xxx,yy,sismol,tem,direct,x,y);
            end
            else
            begin
            draw(170,100,320,100,white);
            draw(170,100,320,100,black);
            end;
            end
          else if (tem<>77) and (sismol=5) then
             begin
             draw(170,100,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(170,100,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
     else if fire=pgup then begin
         if tem=77 then begin
           if (x>160) and (y<100) then
           begin
           hits:=hits+1;
           draw(170,90,x,y,white);
           move(explosion,sprite,128);
           putspritec(x,y);
           draw(170,90,x,y,black);
           move(blank,sprite,128);
           putspritec(x,y);
           direct:=random(8)+1;
         what(xxx,yy,sismol,tem,direct,x,y);
           end
           else
           begin
           draw(170,90,320,0,white);
           draw(170,90,320,0,black);
           end;
           end
     else if (tem<>77) and (sismol=3) then
             begin
             draw(170,90,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(170,90,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
     else if fire=home then begin
         if tem=77 then begin
           if (x<160) and (y<100) then
           begin
           hits:=hits+1;
           draw(150,90,x,y,white);
           move(explosion,sprite,128);
           putspritec(x,y);
           draw(150,90,x,y,black);
           move(blank,sprite,128);
           putspritec(x,y);
           direct:=random(8)+1;
         what(xxx,yy,sismol,tem,direct,x,y);
           end
           else
           begin
           draw(150,90,0,0,white);
           draw(150,90,0,0,black);
           end;
           end
     else if (tem<>77) and (sismol=1) then
             begin
             draw(150,90,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(150,90,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
     else if fire=dleft then begin
          if tem=77 then begin
           if (x<160) and (y>100) then
           begin
           hits:=hits+1;
           draw(150,110,x,y,white);
           move(explosion,sprite,128);
           putspritec(x,y);
           draw(150,110,x,y,black);
           move(blank,sprite,128);
           putspritec(x,y);
           direct:=random(8)+1;
         what(xxx,yy,sismol,tem,direct,x,y);
          end
           else
           begin
            draw(150,110,0,200,white);
            draw(150,110,0,200,black);
            end;
            end
     else if (tem<>77) and (sismol=6) then
             begin
             draw(150,110,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(150,110,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
     else if fire=pgdn then begin
          if tem=77 then begin
           if (x>160) and (y>100) then
           begin
           hits:=hits+1;
           draw(170,110,x,y,white);
           move(explosion,sprite,128);
           putspritec(x,y);
           draw(170,110,x,y,black);
           move(blank,sprite,128);
           putspritec(x,y);
           direct:=random(8)+1;
         what(xxx,yy,sismol,tem,direct,x,y);
           end
           else
           begin
           draw(170,110,320,200,white);
           draw(170,110,320,200,black);
           end;
          end
         else if (tem<>77) and (sismol=8) then
             begin
             draw(170,110,xxx,yy,white);
             move(explosion,sprite,128);
             putspritec(xxx,yy);
             draw(170,110,xxx,yy,black);
             move(blank,sprite,128);
             putspritec(xxx,yy);
             direct:=random(8)+1;
             what(xxx,yy,sismol,tem,direct,x,y);
             if tem=1 then hits:=hits+5;
             if tem=2 then hits:=hits-5;
             tem:=77;
            end
           end
    end;
{----------------------------------MOVEHIM}
procedure movehim(var missyconrad,xxx,yy,sismol,tem,counts,x,y:integer;
                  var level,direct:integer);
begin
   if direct=2 then y:=y+3*level;
   if direct=8 then y:=y-3*level;
   if direct=6 then x:=x-5*level;
   if direct=4 then x:=x+5*level;
   if direct=7 then begin
    x:=x+5*level; y:=y-3*level;
    end;
   if direct=9 then begin
    x:=x-5*level; y:=y-3*level;
   end;
   if direct=1 then begin
    x:=x+5*level; y:=y+3*level;
   end;
   if direct=3 then begin
    x:=x-5*level; y:=y+3*level;
   end;
   if tem=77 then
   begin
   move(small,sprite,128);
   putspritec(x,y);
   end
   else if tem=1 then
   begin
    move(plus,sprite,128);
    putspritec(xxx,yy);
    counts:=counts+1;
    if counts>missyconrad then
    begin
     direct:=random(8)+1;
     what(xxx,yy,sismol,tem,direct,x,y);
     move(blank,sprite,128);
     putspritec(xxx,yy);
     counts:=0;
    end;
   end
   else if tem=2 then
   begin
    move(minus,sprite,128);
    putspritec(xxx,yy);
    counts:=counts+1;
    if counts>missyconrad then
    begin
     direct:=random(8)+1;
     what(xxx,yy,sismol,tem,direct,x,y);
     move(blank,sprite,128);
     putspritec(xxx,yy);
     counts:=0;
     end;
   end;
end;
{------------------------GAME}
procedure game;
type
   persontype=record
      name:string[30];
      score:integer;
      percent:real;
      lev:integer;
    end;
var
   level,
   sam,
   actual,
   sam2,
   sismol,
   tem,
   xx,
   direct,
   rshots,
   c,
   hits,
   x,xxx,
   y,yy,missyconrad,
   counts:integer;
   dead:boolean;
   fire:char;
begin
   graphcolormode;
   palette(2);
   rshots:=0;
   level:=0;
   hits:=0;
   xxx:=0;
   yy:=0;
   x:=160;
   y:=100;
   sismol:=random(7)+1;
   move(gunner,sprite,128);
   counts:=0;
   tem:=77;
   direct:=random(8)+1;
   dead:=false;
   what(xxx,yy,sismol,tem,direct,x,y);
   putspritec(160,100);
   xx:=0;
   while (not dead) or (rshots<99) do
      begin
         read(kbd,fire);
         firing(xxx,yy,sismol,rshots,tem,hits,direct,x,y,fire);
         missyconrad:=random(10);
         while (not keypressed) and (not dead) do
            begin
              gotoxy(10,1);
              write('LEVEL:',level);
              if rshots>50*level then level:=level+1;
              move(blank,sprite,128);
              putspritec(x,y);
              movehim(missyconrad,xxx,yy,sismol,tem,counts,x,y,level,direct);
              for sam:=-15 to 15 do
              for sam2:=-15 to 15 do
              if (x=160+sam) and (y=100+sam2) then begin
              move(explosion,sprite,128);
              putspritec(x,y);
              dead:=true;
              end;
            end;
         if dead then begin write('GAME OVER'); actual:=rshots; rshots:=10000; for sam:=1 to 5000 do; end;
         if rshots>9999 then dead:=true;
      end;
     hires;
     clrscr;
     names(level,actual,hits);
end;
{---------------------------------MAIN}
begin
   graphcolormode;
   demo;
   read(kbd,yes);
   hires;
   instructions;
   game;
   repeat
   writeln;
   writeln;
   writeln('Do you want to play again?  Y/N');
   read(kbd,yes);
   if (yes='y') or (yes='Y') then game;
   until (yes='n') or (yes='N');
end.
{This game is wonderful}