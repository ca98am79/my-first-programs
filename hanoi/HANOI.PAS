program hanoi(input,output);
var
   frompeg,auxpeg,topeg:char;
   n:integer;
{---------------------TOWER}
procedure tower(frompeg,topeg,auxpeg:char;
                n:integer);
var c:char;
begin
   if n<=1 then writeln('Move disk 1 from ',frompeg,' to ',topeg)
   else
    begin
      tower(frompeg,auxpeg,topeg,n-1);
      writeln('Move disk ',n,' from ',frompeg,' to ',topeg);
      tower(auxpeg,topeg,frompeg,n-1);
    end;
 end;
 {--------------------MAIN}
 begin
    writeln('How many disks?');
    readln(n);
    tower('A','C','B',n);
 end.