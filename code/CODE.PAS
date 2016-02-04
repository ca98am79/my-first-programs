program readd(input,output,infile);
var
 y,x:integer;
 c:char;
 s:string[74];
 st:string[15];
 infile:text;
begin
graphbackground(1);
textbackground(1);
textcolor(15);
clrscr;
writeln('Enter name of file to read.');
writeln;
readln(st);
writeln('-------------------------------------------------');
writeln;
if st='' then
begin
     writeln('ERROR');
     halt;
end;
assign(infile,st);
reset(infile);
y:=0;
while not eof(infile) do
 begin
  readln(infile,s);
  for x:=1 to 74 do
  begin
       if s[x]='a' then s[x]:='o'
       else if s[x]='b' then s[x]:='w'
       else if s[x]='c' then s[x]:='l'
       else if s[x]='e' then s[x]:='k'
       else if s[x]='f' then s[x]:='a'
       else if s[x]='g' then s[x]:='m'
       else if s[x]='h' then s[x]:='c'
       else if s[x]='i' then s[x]:='q'
       else if s[x]='j' then s[x]:='r'
       else if s[x]='k' then s[x]:='j'
       else if s[x]='l' then s[x]:='f'
       else if s[x]='m' then s[x]:='x'
       else if s[x]='n' then s[x]:='h'
       else if s[x]='o' then s[x]:='g'
       else if s[x]='p' then s[x]:='e'
       else if s[x]='q' then s[x]:='p'
       else if s[x]='r' then s[x]:='b'
       else if s[x]='s' then s[x]:='v'
       else if s[x]='t' then s[x]:='n'
       else if s[x]='u' then s[x]:='z'
       else if s[x]='v' then s[x]:='s'
       else if s[x]='w' then s[x]:='t'
       else if s[x]='x' then s[x]:='u'
       else if s[x]='y' then s[x]:='y'
       else if s[x]='z' then s[x]:='i';
      end;
  writeln(s);
  y:=y+1;
  if y>20 then begin writeln; textcolor(4);
  writeln('<Press any key>');
  textcolor(15); read(kbd,c);
  writeln; y:=0; end;
 end;
 writeln;
 writeln('-------------------------------------------------');
close(infile);
end.

