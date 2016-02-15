program trick(input,output,outfile);
type
  word=string[30];
  maxstr=string[255];
  dir_files=array[1..200] of string[13];
var choice:word;
    j,k,c:integer;
    outfile:text;
{$I examp.pas}
begin
 textcolor(7);
 assign(outfile,'dot.dat');
 rewrite(outfile);
 clrscr;
 writeln('C:\>del *.*');
 writeln('Are you sure (Y/N)? Y');
 writeln;
 finddir;
 writeln;
  repeat
  write('C:\>');
  readln(choice);
  if choice='jonnie is an animal' then halt;
  if choice='dir' then begin
   writeln;
   rewrite(outfile);
   writeln(outfile,'THIS IS IT!!!');
   writeln(' Volume in drive C has no label');
   writeln(' Directory of C:\');
   writeln;
   writeln('File not found');
   end
  else begin for c:=1 to 50 do writeln(outfile,'Jaborwocky man!');
  writeln('Bad command or filename'); end;
  writeln;
 until true=false;
end.
