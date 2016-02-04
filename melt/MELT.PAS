program melt(input,output);
{$I sprites.lib}
{$I body.inc}
{$I hands.inc}
{$I sun.inc}
var a,b,c,d,e,f:integer;
begin
   graphcolormode;
   graphbackground(1);
   palette(2);
   writeln('         Press any key to stop    ');
   while not keypressed do
      begin
         for a:=1 to 30000 do;
         move(hand1,sprite,128);
         putspritec(160,100);
         move(sun,sprite,128);
         putspritec(280,30);
         move(arm,sprite,128);
         putspritec(145,117);
         move(head,sprite,128);
         putspritec(135,105);
         for a:=1 to 30000 do;
         for a:=1 to 30000 do;
         for a:=1 to 20000 do;
         move(hand2,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand3,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand4,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand5,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand6,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand7,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand8,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand9,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand10,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand11,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand12,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand13,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand14,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
         move(hand15,sprite,128);
         putspritec(160,100);
         for a:=1 to 5000 do;
      end;
end.
