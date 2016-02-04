program cars(input, output);
{$I car.inc}
{$I glop.inc}
{$I sun.inc}
{$I block.inc}
{$I bomb.inc}
{$I clouds.inc}
{$I rock.inc}
{$I sprites.lib}
{$I blank.inc}
{$I mis.inc}
const
   up=#$48; left=#$4b; right=#$4d; pgup=#$49; home=#$47;
var a,amt,b,blockx,blocky,c,cnt,de,f,level,x,x1,y,hits,v:integer;
    d:char;
    bri,dead,blown:boolean;
{--------------------------------INSTRUCTIONS}
procedure instructions;
begin
   clrscr;
   writeln('               C             A           R         S');
   writeln;
   writeln;
   writeln('  To control the car you simply press the arrow (function) keys');
   writeln('on your keyboard towards the direction you want to go.  Pressing');
   writeln('the up arrow will make your car jump, and pressing spacebar will');
   writeln('make your car fire a laser.');
   writeln;
   writeln(' GOOD LUCK');
   writeln;
   repeat until keypressed;
end;
{--------------------------------BRIDGE}
procedure bridge(var bri:boolean);
begin
   bri:=true;
   draw(220,50,260,50,green);
   draw(220,51,260,51,green);
   draw(220,52,260,52,green);
end;
{--------------------------------LEV2}
procedure lev2(var level:integer);
begin
   clrscr;
   graphcolormode; graphbackground(1); palette(2);
   move(cloud,sprite,128);
   putspritec(190,10);
   putspritec(20,6);
   move(sun,sprite,128);
   putspritec(300,10);
   draw(1,50,220,50,white);
   draw(320,200,320,50,white);
   draw(220,50,220,200,white);
   draw(260,50,260,200,white);
   draw(260,50,320,50,white);
   draw(220,199,260,199,white);
   y:=40;
   x:=10; level:=2;
end;
{--------------------------------ROCKS}
procedure rocks(var x,y,b,c:integer);
var v:integer;
begin
   if b>5 then b:=b-6; if c<155 then c:=c+3;
   if b<=5 then
    begin
     b:=301; c:=35;
    end;
   move(rock,sprite,128);
   putspritec(b,c);
   for v:=1 to 1000 do;
   move(blank,sprite,128);
   putspritec(b,c);
end;
{--------------------------------LEV3}
procedure lev3(var level:integer);
begin
   clrscr; graphcolormode; graphbackground(1); palette(2);
   move(cloud,sprite,128);
   putspritec(260,20);
   putspritec(160,55);
   move(sun,sprite,128);
   putspritec(300,10);
   draw(1,170,100,170,white);
   draw(100,170,100,150,white);
   draw(100,150,320,50,white);
   level:=3;
   y:=160;
   x:=10;
end;
{--------------------------------BOMBING}
procedure bombing(var f,x1,x,y:integer;
                  var deaths:boolean);
var e,d:integer;
begin
     x1:=x1-10;
     if x1<20 then x1:=320;
     for e:=-5 to 5 do
     begin
     if x1=x+e then
      begin
       deaths:=true;
       move(explosion,sprite,128);
       putspritec(x,y);
       for d:=1 to 1000 do;
       move(blank,sprite,128);
       putspritec(x,y);
      end;
     end;
     move(bomb,sprite,128);
     putspritec(x1,160);
     for d:=1 to 500 do;
     move(blank,sprite,128);
     putspritec(x1,160);
end;
{--------------------------------LEV4}
procedure lev4(var f,x1,y,hits,level,x:integer;
               var deaths:boolean);
begin
    hits:=0;
    level:=4;
    x:=50;
    clrscr; graphcolormode; graphbackground(1); palette(2);
    draw(1,170,160,170,green);
    draw(160,170,190,170,white);
    draw(190,170,320,170,green);
    draw(1,150,30,20,green);
    draw(30,20,300,20,green);
    draw(300,20,320,150,green);
    bombing(f,x1,x,y,deaths);
end;
{--------------------------------DROPBLOCK}
procedure dropblock(var blockx,blocky:integer);
var h:integer;
begin
   if blocky>187 then
   begin
    move(block,sprite,128);
    putspritec(blockx,182);
    for h:=1 to 8000 do;
    move(blank,sprite,128);
    putspritec(blockx,182);
    blocky:=11;
    blockx:=random(310)+5;
   end;
   move(block,sprite,128);
   putspritec(blockx,blocky);
  { for h:=1 to 1000 do;}
   move(blank,sprite,128);
   putspritec(blockx,blocky);
   blocky:=blocky+15;
end;
{--------------------------------LEV5}
procedure lev5(var blockx,blocky,hits,x,y,level:integer);
var h,num:integer;
begin
   hits:=0;
   graphcolormode; graphbackground(3); palette(2);
   draw(1,192,320,192,blue);
   level:=5;
   y:=1;
   for num:= 1 to 36 do
   begin
     move(car,sprite,128);
     putspritec(179,y+5*num);
     for h:=1 to 1000 do;
     move(blank,sprite,128);
     putspritec(179,y+5*num);
   end;
   y:=y+5*num;
   move(car,sprite,128);
   putspritec(x,y);
   dropblock(blockx,blocky);
end;
{--------------------------------DRAWDOOR}
procedure drawdoor;
 begin
    draw(317,170,317,150,green);
    draw(318,170,318,150,green);
    draw(319,170,319,150,green);
end;
{--------------------------------FIRE}
procedure fire(var x1,level,amt,x,y,hits:integer;
               var blown:boolean);
var c:integer;
begin
   if amt=0 then
    begin
      amt:=1;
      if level=3 then
       begin
        if blown=false then
        begin
        draw(x+5,y+2,99,y+2,white);
        for c:=1 to 500 do;
        draw(x+5,y+2,99,y+2,black);
        hits:=hits+1;
        if hits>9 then
         begin
           blown:=true;
           move(explosion,sprite,128);
           putspritec(100,160);
           for c:=1 to 5000 do;
           move(blank,sprite,128);
           putspritec(100,160);
           draw(100,170,320,170,green);
           draw(130,140,320,140,green);
           draw(100,150,130,140,green);
         end
        end
        else if blown=true then
         begin
          draw(x+5,y+2,320,y+2,white);
          for c:=1 to 500 do;
          draw(x+5,y+2,320,y+2,black);
         end
        end
      else
      begin
       if level<>4 then
       begin
         draw(x+5,y+2,320,y+2,white);
         for c:=1 to 500 do;
         draw(x+5,y+2,320,y+2,black);
       end
       else if level=4 then
       begin
         draw(x+5,y+2,x1,y+2,white);
         for c:=1 to 500 do;
         draw(x+5,y+2,x1,y+2,black);
         move(explosion,sprite,128);
         putspritec(x1,160);
         for c:=1 to 1500 do;
         move(blank,sprite,128);
         putspritec(x1,160);
         x1:=320;
       end;
      end;
   end;
end;
{-------------------------------FALL}
procedure fall;
var x,y:integer;
begin
   graphcolormode; graphbackground(1); palette(2);
   draw(160,1,160,200,green);
   draw(190,1,190,200,green);
   for x:=1 to 40 do
   begin
     move(car,sprite,128);
     putspritec(179,1+x*5);
     for y:=1 to 1000 do;
     move(blank,sprite,128);
     putspritec(179,1+x*5);
   end;
end;
{--------------------------------DROP}
procedure drop(var blockx,blocky,hits,x,y,level:integer);
var a,b,c:integer;
begin
   draw(160,170,190,170,black);
   draw(160,170,160,200,green);
   draw(190,170,190,200,green);
   move(blank,sprite,128);
   putspritec(179,160);
   putspritec(170,160);
   putspritec(180,160);
   for b:=1 to 13 do
   begin
     move(car,sprite,128);
     putspritec(179,170+b*2);
     for c:=1 to 1000 do;
     move(blank,sprite,128);
     putspritec(179,170+b*2);
   end;
   for a:=1 to 2 do
   fall;
   lev5(blockx,blocky,hits,x,y,level);
end;
{--------------------------------LEV6}
procedure lev6(var level,cnt:integer);
var h:integer;
begin
   level:=6;
   cnt:=-156;
   clrscr;
   graphcolormode; graphbackground(1); palette(2);
   move(cloud,sprite,128);
   putspritec(40,30);
   move(sun,sprite,128);
   putspritec(160,10);
   draw(1,192,320,192,white);
   move(glop,sprite,128);
   for a:=1 to 10 do
   for h:=1 to 32 do
   begin
     putspritec(h*10,a*10);
   end;
end;
{--------------------------------WHICHWAY}
procedure whichway(var cnt,f,x1,hits,amt,level,x,y:integer;
                   var blown,bri,dead:boolean;
                   var d:char);
var b,j:integer;
begin
   if (d=right) and (level=3) then
   begin
     if x<90 then
      x:=x+2
     else if (x>=90) and (hits>9) then
      x:=x+2
   end;
   if (d=right) and (level=4) then
   begin
    if x>300 then
    begin
     x:=300; drawdoor; end;
   end;
   if (d=right) and (level<>3) then
      x:=x+2
   else if (d=left) and (blown=false) then
    begin
      x:=x-2;
      if level=3 then
       draw(100,170,100,150,white);
    end
   else if (d=left) and (blown=true) then x:=x-2;
   if (d=left) and (x<15) then x:=15;
   move(car,sprite,128);
   putspritec(x,y);
   move(blank,sprite,128);
   if d=right then
      putspritec(x-20,y)
   else if d=left then
      putspritec(x+23,y)
   else if d=' ' then
      fire(x1,level,amt,x,y,hits,blown);
   if (level=1) and (x>310) then
      lev2(level)
   else if (level=2) and (x>310) then
      lev3(level)
   else if (level=5) and (x>310) then
     begin
      if cnt=0 then
      begin
        cnt:=5;
        clrscr; graphcolormode; graphbackground(1); palette(2);
        draw(1,192,320,192,white);
      end
      else if cnt=1 then lev6(level,cnt)
      else
       begin
         x:=5; cnt:=cnt-4; end;
     end
   else if (level=3) and (x>310) then
    begin
      lev4(f,x1,y,hits,level,x,dead); drawdoor; end;
   if (x>235) and (level=2) then
    begin
     if bri=false then
      begin
       move(blank,sprite,128);
       putspritec(x,y);
       for a:=50 to 190 do
        begin
         move(car,sprite,128);
         putspritec(x,a);
        end;
       move(explosion,sprite,128);
       putspritec(x,a);
       dead:=true;
       for b:=1 to 5000 do;
       move(blank,sprite,128);
       putspritec(x,a);
      end;
   end;
end;
{---------------------------------MAIN}
begin
   instructions;
   graphcolormode;
   move(cloud,sprite,128);
   putspritec(200,70);
   putspritec(67,10);
   putspritec(140,55);
   move(sun,sprite,128);
   putspritec(300,10);
   dead:=false;
   amt:=0;
   f:=0;
   hits:=0;
   bri:=false;
   graphbackground(1);
   cnt:=0;
   palette(2);
   draw(1,180,320,180,white);
   move(car,sprite,128);
   x:=20; y:=170;
   level:=1;
   blockx:=random(319)+1; blocky:=11;
   blown:=false;
   b:=301; c:=35;
   putspritec(x,y);
   while dead<>true do
   begin
      read(kbd,d);
      whichway(cnt,f,x1,hits,amt,level,x,y,blown,bri,dead,d);
      if d=up then
       begin
        if level=4 then
        begin
         for a:=-10 to 10 do
          if x=175+a then hits:=hits+1;
          if hits>3 then drop(blockx,blocky,hits,x,y,level);
        end;
        if hits<3 then
        begin
        move(blank,sprite,128);
        putspritec(x,y);
        move(car,sprite,128);
        putspritec(x,y-10);
        for a:=1 to 5000 do;
        if (level=2) and ((x>205) and (x<245)) then bridge(bri);
        putspritec(x,y);
        move(blank,sprite,128);
        putspritec(x,y-10);
        end;
       end;
      while (not keypressed) and (dead<>true) do
         begin
            if level=5 then dropblock(blockx,blocky);
            whichway(cnt,f,x1,hits,amt,level,x,y,blown,bri,dead,d);
            if (level=3) and (x<100) then rocks(x,y,b,c);
            if level=4 then bombing(f,x1,x,y,dead);
            if level=5 then dropblock(blockx,blocky);
            if (level=3) or (level=5) then
            begin
              for v:=-10 to 10 do
              begin
              for de:=-10 to 10 do
              begin
      if ((x=b+v) and (y=c+de)) or ((x=blockx+v) and (y=de+blocky)) then
                 begin
                   move(explosion,sprite,128);
                   putspritec(x,y);
                   for v:=1 to 1500 do;
                   move(blank,sprite,128);
                   putspritec(x,y);
                   dead:=true;
                 end; end; end; end;
            if dead then
              writeln('You died!');
         end;
       amt:=0;
    end;
end.