program sea(input,output);
{$I bait.inc}
{$I mis.inc}
{$I men.inc}
{$I fish.inc}
{$I blank.inc}
{$I sprites.lib}
type
   persontype=record
      name:string[30];
      score:integer;
   end;
const
   up=#$48; down=#$50; left=#$4b; right=#$4d; home=#$47;
   pgup=#$49; dleft=#$4f; pgdn=#$51;
var
   shannoncunningham,missyconrad,points,lilx,lily,x,y,fishes:integer;
   d:char;
{--------------------------------top10}
{$I top10.dat}
{----------------------------------WHICHWAY}
procedure whichway(d:char;
                   var x,y:integer);
begin
if d='8' then y:=y-5
else if d='6'{right} then x:=x+5
else if d='4'{left} then x:=x-5
else if d='2'{down} then y:=y+5
else if d='7'{home} then begin x:=x-5; y:=y-5; end
else if d='9'{pgup} then begin x:=x+5; y:=y-5; end
else if d='3'{pgdn} then begin x:=x+5; y:=y+5; end
else if d='1'{dleft} then begin x:=x-5; y:=y+5; end;
if x>310 then x:=310;
if y>195 then y:=195;
if x<15 then x:=15;
if y<30 then y:=30;
end;
{----------------------------------lilfish}
procedure lilfish(var points,lilx,lily:integer);
begin
   lilx:=lilx-10;
   if lilx<11 then
   begin
     lilx:=310;
     points:=points-1;
     lily:=random(170)+30;
   end;
end;
{----------------------------------MAIN}
begin
   graphcolormode;
   lilx:=320;
   lily:=random(170)+30;
   graphbackground(1);
   palette(2);
   draw(1,17,320,17,1);
   move(man,sprite,128);
   putspritec(160,100);
   x:=160;
   y:=100;
   points:=100;
   gotoxy(1,1);
   write('Points:100');
   move(man,sprite,128);
   missyconrad:=240;
   putspritec(240,7);
   putspritec(265,7);
   putspritec(290,7);
   fishes:=3;
   repeat
      read(kbd,d);
      if d<>' ' then begin
      move(blank,sprite,128);
      putspritec(x,y);
      whichway(d,x,y);
      end;
      repeat
         gotoxy(1,1);
         write('Points:',points,'  ');
         if d<>' ' then begin
         move(blank,sprite,128);
         putspritec(x,y);
         whichway(d,x,y);
         move(man,sprite,128);
         putspritec(x,y);
         move(manw,sprite,128);
         putspritec(x,y);
         end;
         move(blank,sprite,128);
         putspritec(lilx,lily);
         lilfish(points,lilx,lily);
         if (x=lilx) and (abs(y-lily)<6) then
          begin
             points:=points+5;
             lily:=random(170)+30;
             lilx:=310;
             shannoncunningham:=random(1);
             if shannoncunningham<3 then
             begin
                move(mans,sprite,128);
                putspritec(x,y);
                delay(350);
                move(blank,sprite,128);
                putspritec(missyconrad,7);
                fishes:=fishes-1;
                if fishes=0 then d:='q';
                if fishes=2 then missyconrad:=265
                else if fishes=1 then missyconrad:=290;
                move(fish1,sprite,128);
                putspritec(x,y);
                delay(350);
             end;
          end;
         move(minow,sprite,128);
         putspritec(lilx,lily);
      until keypressed;
   until d='q';
   gotoxy(10,10);
   write('GAME OVER');
   hires;
   clrscr;
   names(points);
end.




