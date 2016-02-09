program popup(input,output);
var x,d,f,g,h,i:integer;
begin
repeat
d:=random(319);
f:=random(199);
h:=random(319);
i:=random(199);
g:=random(15);
clrscr;
textbackground(g);
graphbackground(g);
window(d,f,d+g,f+g);
gotoxy(1,1);
g:=random(15);
for x:=1 to 20 do begin textbackground(g); write('       '); end;
window(h,i,h+g,i+g);
gotoxy(1,1);
g:=random(15);
for x:=1 to 20 do begin write('               '); textbackground(g); end;
until keypressed;
end.