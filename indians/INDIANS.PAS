program out(input,output);
const
   bwseg = $b800; bwofs = $0000;
   bell = #$7;
var
   quit,eks,why,i : integer;
begin
   window(1,1,80,25);
   fillchar(mem[bwseg : bwofs],4000,' ');
   textcolor(4);
   quit := random(25) + 5;
   for i := 1 to quit do begin
      eks := random(70) + 1; why := random(25) + 1; textbackground(1);
      gotoxy(eks,why); write(' Go Tribe! '); write(bell); delay(20 * random(9));
      textbackground(2); gotoxy(eks,why); write('           '); end;
   gotoxy(1,25);
end.
