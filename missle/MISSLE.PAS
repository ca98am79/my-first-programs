program missle;
var
   move : string[30];
   alive : boolean;
   i,count : integer;
procedure animation;
var
j : integer;
begin
for j := 1 to 10 do begin
writeln(' o   o   o   o   o   o   o   o   o   o');
writeln('o   o   o   o   o   o   o   o   o   o ');
writeln(' o   o   o   o   o   o   o   o   o   o');
writeln('  o   o   o   o   o   o   o   o   o   o');
writeln(' o   o   o   o   o   o   o   o   o   o');end;
end;
procedure vein;
begin
writeln('You are swept away in a waterfall of red blood.');
animation;
readln(move);
while move <> 'yuck' do begin
if length(move) = 1 then case move of
'l' : writeln('You are laying in a pile of mucous. you think you are in the nose.');
'w' : writeln('You are caught in the mucous.');
'e' : writeln('You are caught in the mucous.');
'n' : writeln('You are caught in the mucous but you feel something in your pocket.');
else writeln('You can''t do that.'); end
else writeln('You can''t do that.');
readln(move); end
end;
begin
clrscr;
count := 1;
writeln('You were accidentily shot into another mans body. You must escape!');
readln(move);
while move <> 'e' do begin
if length(move) =1 then case move of
'l' : writeln('All you see is red, but you hear a pumping sound in the distance...');
'n' : writeln('Hard bone is north.');
'w' : vein;
's' : writeln('You would fall into soft muscle.');
else writeln('You can''t do that.'); end
else writeln('You can''t do that.');
readln(move);
end;
writeln('You are crushed by a knee cap.');
end.
