program postfix(input,output,infile);
type
   stacktype=^stackrecord;
   data=integer;
   stackrecord=record
      info:data;
      next:stacktype;
     end;
   expressiontype=array[1..30] of integer;
var
   stack:stacktype;
   expression1,expression2:expressiontype;
   x,thing,y:integer;
   ch:char;
   infile:text;
{----------------------------------INITIALIZESTACK}
procedure initializestack(var stack:stacktype);
begin
   stack:=nil
end;
{----------------------------------HEADER}
procedure header;
begin
   writeln('Mike Carson');
   writeln('APCSCI period 2');
   writeln('POSTFIX THING');
   writeln;
end;
{----------------------------------EMPTY}
function empty(stack:stacktype):boolean;
begin
   empty:=(stack=nil);
end;
{----------------------------------PUSH}
procedure push(item:data; var stack:stacktype);
var newelement:stacktype;
begin
   new(newelement);
   newelement^.info:=item;
   newelement^.next:=stack;
   stack:=newelement;
end;
{---------------------------------POP}
procedure pop(var item:data; var stack:stacktype);
var element:stacktype;
begin
   element:=stack;
   item:=element^.info;
   stack:=stack^.next;
   dispose(element);
end;
{-------------------------------FIGURE}
procedure figure(ch:char; var stack:stacktype);
var x,y:integer;
begin
   pop(x,stack);
   pop(y,stack);
   if ch='*' then
      push(y*x,stack)
   else if ch='+' then
      push(y+x,stack)
   else if ch='/' then
      push(trunc(y/x),stack)
   else if ch='-' then
      push(y-x,stack);
end;
{-------------------------------READANDDECIDE}
procedure ReadAndDecide(var infile:text;
                        var stack:stacktype);
var ch:char;
begin
   while not eoln(infile) do
   begin
      read(infile,ch);
      write(ch);
      if ord(ch)>47 then
         push(ord(ch)-48,stack)
      else
         figure(ch,stack);
   end;
   readln(infile);
end;
{-------------------------------INPRI}
function inpri(ch:char):integer;
begin
   if ch='*' then inpri:=2
   else if ch='/' then inpri:=2
   else if ch='+' then inpri:=1
   else if ch='-' then inpri:=1
   else if ch='(' then inpri:=3
   else if ch=')' then inpri:=0
   else if ch='$' then inpri:=0;
end;
{-------------------------------OUTPRI}
function outpri(ch:char):integer;
begin
   if ch='*' then outpri:=2
   else if ch='/' then outpri:=2
   else if ch='+' then outpri:=1
   else if ch='-' then outpri:=1
   else if ch='(' then outpri:=0
   else if ch='$' then outpri:=0;
end;
{-------------------------------TRANSLATE}
procedure translate(var stack:stacktype;
                    var expression1,expression2:expressiontype;
                    var x:integer);
var ch:char;
    dumber,ctr,ctr2,dum:integer;
begin
   push(ord('$'),stack);
   ctr:=0;
   ctr2:=0;
   dumber:=x;
   while ctr<=dumber do
   begin
      ctr:=1+ctr;
      ch:=chr(expression1[ctr]);
      if (ord(ch)>47) then
       begin
         ctr2:=ctr2+1;
         expression2[ctr2]:=ord(ch);
       end
      else if ch=')' then
        begin
         repeat
            pop(dum,stack);
            ctr2:=ctr2+1;
            expression2[ctr2]:=dum;
            pop(dum,stack);
         until (chr(dum))='(';
         x:=x-2;
        end
      else if ord(ch)<48 then
         begin
            if (inpri(ch)<=outpri(chr(stack^.info))) then
               begin
                  pop(dum,stack);
                  if dum>40 then
                  begin
                     ctr2:=ctr2+1;
                     expression2[ctr2]:=dum;
                  end;
               end;
            push(ord(ch),stack);
         end;
   end;
   while stack^.info<>ord('$') do
   begin
     pop(dum,stack);
     if dum>40 then
     begin
        ctr2:=ctr2+1;
        expression2[ctr2]:=dum;
     end;
   end;
end;
{-------------------------------ORIG}
procedure orig(var infile:text;
               var expression1:expressiontype;
               var x:integer);
var ch:char;
    p:integer;
begin
   for p:=1 to 30 do
      expression1[p]:=0;
   x:=0;
   while not eoln(infile) do
   begin
      x:=x+1;
      read(infile,ch);
      expression1[x]:=ord(ch);
      write(ch);
   end;
end;
{-------------------------------WRITEXP}
procedure writexp(expression:expressiontype;
                  length:integer);
var counter:integer;
begin
   for counter:=1 to length do
   begin
{      if expression[counter]>39 then}
         write(chr(expression[counter]));
   end;
   writeln;
end;
{-------------------------------INITEXP}
procedure initexp(expression:expressiontype);
var o:integer;
begin
   for o:=1 to 30 do
      expression[o]:=0;
end;
{-------------------------------MAIN}
begin
   header;
   assign(infile,'postfix.txt');
   reset(infile);
   initializestack(stack);
   while not eof(infile) do
   begin
      read(infile,ch);
      if ch='1' then
      begin
        writeln('1. Evaluating a postfix expression:');
        ReadAndDecide(infile,stack);
        pop(thing,stack);
        writeln(' = ',thing);
        writeln;
        initializestack(stack);
      end
      else if ch='2' then
      begin
         writeln('2. Converting infix to postfix:');
         orig(infile,expression1,x);
         initexp(expression2);
         translate(stack,expression1,expression2,x);
         write(' converted to postfix is ');
         writexp(expression2,x);
         writeln;
         writeln;
         initializestack(stack);
      end
      else if ch='3' then
      begin
         writeln('3. Evaluating infix expression:');
         orig(infile,expression1,x);
         initexp(expression2);
         translate(stack,expression1,expression2,x);
         writeln;
         writexp(expression2,x);
         for y:=1 to x do
         begin
            if expression2[y]>47 then
               push(expression2[y]-48,stack)
            else
               figure(chr(expression2[y]),stack);
         end;
         pop(thing,stack);
         writeln(' = ',thing);
         initializestack(stack);
         writeln;
      end;
   end;
end.


