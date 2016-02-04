program unscram(input,output);
type
  wordtype=array [1..20] of char;
var
  words:wordtype;
  x,y,z,j,k:integer;
  c,pause:char;
{----------------------swap}
procedure swap(var a,b:char);
var t:char;
begin
   t:=a;
   a:=b;
   b:=t;
end;
{------------------------word}
function word(words:wordtype):boolean;
var
 a,e,i,o,u:char;
 b,l,c,h,f,r,s,p,d,g,t,k:char;
begin
  a:='a'; e:='e'; i:='i'; o:='o'; u:='u';
  if ((words[1]=a) or (words[1]=e) or (words[1]=i) or (words[1]=o) or (words[1]=u)) and ((words[2]<>a) and (words[2]<>e)
   and (words[2]<>i) and (words[2]<>o) and (words[2]<>u)) then word:=true;
  if words[1]=words[2] then word:=false;
  if (words[1]='q') and (words[2]<>'u') then word:=false;
  if (words[1]='b') and ((words[2]='r') or (words[2]='l')) then
    if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if (words[1]='s') and ((words[2]='c') or (words[2]='h') or (words[2]='p') or (words[2]='l') or
    (words[2]='k') or (words[2]='l') or (words[2]='t')) then
      if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if (words[1]='c') and ((words[2]='h') or (words[2]='r') or (words[2]='l')) then
     if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if (words[1]='g') and ((words[2]='l') or (words[2]='r')) then
     if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if (words[1]='t') and ((words[2]='h') or (words[2]='r')) then
     if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if (words[1]='f') and ((words[2]='r') or (words[2]='l')) then
     if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if (words[1]='d') and (words[2]='r') then
     if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if (words[1]='p') and ((words[2]='h') or (words[2]='l') or (words[2]='r')) then
     if (words[3]=a) or (words[3]=e) or (words[3]=i) or (words[3]=o) or (words[3]=u) then word:=true;
  if ((words[1]<>a) and (words[1]<>e) and (words[1]<>i) and (words[1]<>o) and (words[1]<>u)) and ((words[2]=a) or
   (words[2]=e) or (words[2]=i) or (words[2]=o) or (words[2]=u)) then word:=true;
end;
{-----------------------writeit}
procedure writeit(x,y:integer;
                  var words:wordtype);
begin
   for y:=1 to (x-1) do
   begin
      if word(words)=true then textcolor(4)
      else textcolor(15);
      write(words[y]);
   end;
   write('  ');
end;
{------------------------figure}
procedure figure(var x,y,z:integer;
                 var words:wordtype;
                 var pause:char);
var
  h,ff,ee,cc,gg:integer;
  hi:char;
begin
   if z=2 then
   begin
    swap(words[z-1],words[z]);
    writeit(x,y,words);
   end
   else if z=3 then
   begin
    for h:=1 to 3 do
    begin
     swap(words[z-1],words[z]);
     writeit(x,y,words);
     swap(words[z-2],words[z-1]);
     writeit(x,y,words);
    end;
   end
   else if z=4 then
   begin
    for h:=1 to 12 do
    begin
     swap(words[z-1],words[z]);
     writeit(x,y,words);
     if (h mod 3)=0 then begin
     if h<>9 then
     swap(words[1],words[2])
     else
     swap(words[1],words[4]);
     writeln;
     end
     else
     swap(words[z-2],words[z-1]);
     writeit(x,y,words);
     end;
    end
   else if z=5 then
   begin
   for ff:=1 to 5 do begin
    for h:=1 to 12 do
    begin
     swap(words[z-1],words[z]);
     writeit(x,y,words);
     if (h mod 3)=0 then begin
     if h<>9 then
     swap(words[2],words[3])
     else
     swap(words[2],words[5]);
     writeln;
     end
     else
     swap(words[z-2],words[z-1]);
     writeit(x,y,words);
     end;
    if (ff<>3) and (ff<>4) then
    swap(words[1],words[2])
    else swap(words[1],words[5]);
    writeit(x,y,words);
    end;
    end
  else if z=6 then
   begin
   for gg:=1 to 6 do begin
   for ff:=1 to 5 do begin
    for h:=1 to 12 do
    begin
     swap(words[z-1],words[z]);
     writeit(x,y,words);
     if (h mod 3)=0 then begin
     if h<>9 then
     swap(words[3],words[4])
     else
     swap(words[3],words[6]);
     writeln;
     end
     else
     swap(words[z-2],words[z-1]);
     writeit(x,y,words);
     end;
    if (ff<>3) and (ff<>4) then
    swap(words[2],words[3])
    else swap(words[2],words[6]);
    writeit(x,y,words);
    end;
    if (pause='y') or (pause='Y') then
    read(kbd,hi);
    if (hi='q') or (hi='Q') then halt;
    writeln('---');
    if (gg<>2) and (gg<>3) then
    swap(words[1],words[2])
    else
    swap(words[1],words[6]);
    if (gg=4) then swap(words[1],words[5]);
    if (gg=5) then swap(words[1],words[4]);
    writeit(x,y,words);
    end;
    end
  else if z=7 then
   begin
   for cc:=1 to 7 do begin
   for gg:=1 to 6 do begin
   for ff:=1 to 5 do begin
    for h:=1 to 12 do
    begin
     swap(words[z-1],words[z]);
     writeit(x,y,words);
     if (h mod 3)=0 then begin
     if h<>9 then
     swap(words[4],words[5])
     else
     swap(words[4],words[7]);
     writeln;
     end
     else
     swap(words[z-2],words[z-1]);
     writeit(x,y,words);
     end;
    if (ff<>3) and (ff<>4) then
    swap(words[3],words[4])
    else swap(words[3],words[7]);
    writeit(x,y,words);
    end;
    if (pause='y') or (pause='Y') then
    read(kbd,hi);
    if (hi='q') or (hi='Q') then halt;
    writeln('---');
    if (gg<>2) and (gg<>3) then
    swap(words[2],words[3])
    else
    swap(words[2],words[7]);
    if (gg=4) then swap(words[2],words[6]);
    if (gg=5) then swap(words[2],words[5]);
    writeit(x,y,words);
    end;
    if (cc<>3) and (cc<>4) and (cc<>5) and (cc<>6) then
    swap(words[1],words[2])
    else swap(words[1],words[7]);
    writeit(x,y,words);
    end;
    end
  else if z=8 then
   begin
   for ee:=1 to 8 do begin
   for cc:=1 to 7 do begin
   for gg:=1 to 6 do begin
   for ff:=1 to 5 do begin
    for h:=1 to 12 do
    begin
     swap(words[z-1],words[z]);
     writeit(x,y,words);
     if (h mod 3)=0 then begin
     if h<>9 then
     swap(words[5],words[6])
     else
     swap(words[5],words[8]);
     writeln;
     end
     else
     swap(words[z-2],words[z-1]);
     writeit(x,y,words);
     end;
    if (ff<>3) and (ff<>4) then
    swap(words[4],words[5])
    else swap(words[4],words[8]);
    writeit(x,y,words);
    end;
    if (pause='y') or (pause='Y') then
    read(kbd,hi);
    if (hi='q') or (hi='Q') then halt;
    writeln('---');
    if (gg<>2) and (gg<>3) then
    swap(words[3],words[4])
    else
    swap(words[3],words[8]);
    if (gg=4) then swap(words[3],words[7]);
    if (gg=5) then swap(words[3],words[6]);
    writeit(x,y,words);
    end;
    if (cc<>3) and (cc<>4) and (cc<>5) and (cc<>6) then
    swap(words[2],words[3])
    else swap(words[2],words[8]);
    writeit(x,y,words);
    end;
    end;
    if ee=1 then
    swap(words[1],words[8]);
    writeit(x,y,words);
    end;
end;
{----------------------MAIN}
begin
   textbackground(1);
   textcolor(15);
   clrscr;
   writeln;
   writeln;
   writeln('                             The descrambler!');
   writeln;
   writeln;
   writeln('                              By: Mike Carson');
   read(kbd,c);
   writeln;
   writeln('Would you like pauses? y/n');
   read(kbd,pause);
   repeat
   clrscr;
   c:='z';
   x:=0;
   while ord(c)<>13 do
   begin
     x:=x+1;
     gotoxy(1,1);
     textcolor(15);
     writeln('Enter word to unscramble. Press <ENTER> to quit.');
     textcolor(4);
     writeln('Red words have most chance of being correct.');
     textcolor(15);
     read(kbd,words[x]);
     if (ord(words[x])=8) and (x>1) then
     begin
      x:=x-2;
      gotoxy(x+1,3);
      write(' ');
     end
     else if (x>0) then begin
     gotoxy(x,3);
     write(words[x]);
     end;
     c:=words[x];
     writeln;
   end;
   writeln;
   writeit(x,y,words);
   z:=x;
   z:=z-1;
   figure(x,y,z,words,pause);
   textcolor(15);
   if z=1 then writeln('1 possibility')
   else if z=2 then writeln('2 different possibilities')
   else if z=3 then writeln('6 different possibilities')
   else if z=4 then writeln('24 different possibilities')
   else if z=5 then writeln('120 different possibilities')
   else if z=6 then writeln(120*6,' different possibilities')
   else if z=7 then writeln(120*6*7,' different possibilities')
   else if z=8 then writeln(120*6*7*8,' different possibilities');
   read(kbd,c);
   writeln('--------------');
   until z=0;
end.

