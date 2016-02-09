program drawing(input,output);
var
   a,b,c,d,e,f,g:integer;
begin
  graphcolormode;
  b:=random(320);
  c:=random(199);
  repeat
  begin
     g:=random(4);
     f:=random(4);
     d:=random(320);
     e:=random(199);
     draw(b,c,d,e,f);
     b:=random(320);
     c:=random(199);
     f:=random(4);
     draw(d,e,b,c,f);
     palette(g);
     graphbackground(random(15));
  end;
  until keypressed
end.
