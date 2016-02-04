program diary(input,output,outfile);
var
   outfile:text;
   entry,entry2:string[70];
begin
   clrscr;
   textcolor(7);
   assign(outfile,'diary.dat');
   append(outfile);
   writeln('Enter name, date, and any further comments you might have.');
   writeln('You have 2 lines. Please cooperate.');
   readln(entry);
   readln(entry2);
   writeln(outfile,entry);
   writeln(outfile,entry2);
   writeln(outfile);
   close(outfile);
   clrscr;
end.

