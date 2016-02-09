program tic_tac_toe;
type
   t_array = array[1..27] of string[4];
var
   arr  : t_array;
   check, oh, ex : string[4];
   enter_hit : string[30];
   move, move_counter : integer;
   game_over, cannot_win, cannot_block, oh_ex,
   tsuke, humans_move, cat : boolean;
procedure initialize;
var
   i : integer;
begin
   oh := '/  \';
   ex := ' \/ ';
   for i := 1 to  27 do
      arr[i] := '    ';
   move := random(10);
   while (move <> 1) and (move <> 3) and (move <> 7) and (move <> 9) do
      move := random(10);
   arr[3*move-2]:=' __ ';arr[3*move-1]:='/  \';arr[3*move]:='\__/';
   game_over := false; cannot_win := true; cat := false;
   oh_ex := false; humans_move := false;
   move_counter := 1;
end; { initialize }
procedure print_board;
begin
   if game_over or humans_move or cat
      then begin
         writeln; writeln; writeln; end
      else begin
         writeln('1|2|3');
         writeln('4|5|6');
         writeln('7|8|9'); end;
   writeln;
   write('                          ',arr[1],'    |    ',arr[4]);
   writeln('    |    ',arr[7]);
   write('                          ',arr[2],'    |    ',arr[5]);
   writeln('    |    ',arr[8]);
   write('                          ',arr[3],'    |    ',arr[6]);
   writeln('    |    ',arr[9]);
   writeln('                                  |            |');
   writeln('                       -----------------------------------');
   write('                          ',arr[10],'    |    ',arr[13]);
   writeln('    |    ',arr[16]);
   write('                          ',arr[11],'    |    ',arr[14]);
   writeln('    |    ',arr[17]);
   write('                          ',arr[12],'    |    ',arr[15]);
   writeln('    |    ',arr[18]);
   writeln('                                  |            |');
   writeln('                       -----------------------------------');
   write('                          ',arr[19],'    |    ',arr[22]);
   writeln('    |    ',arr[25]);
   write('                          ',arr[20],'    |    ',arr[23]);
   writeln('    |    ',arr[26]);
   write('                          ',arr[21],'    |    ',arr[24]);
   writeln('    |    ',arr[27]);
   writeln('                                  |            |');
   writeln;
   writeln;
   writeln;
   writeln;
   writeln;
end; { print_board }
procedure human_move;
begin
   writeln('                      Enter a valid move in the range 1 to 9.');
   readln(move);
   while not (move in [1..9]) or (arr[3*move] <> '    ') do begin
      print_board;
      writeln('                             Invalid move : reenter!');
      readln(move); end;
   arr[(3*move)-1] := ' \/ ';
   arr[3*move]     := ' /\ ';
end; { human_move }
procedure take_point(a : integer);
begin
   arr[3*a-2]    :=   ' __ ';
   arr[3*a-1]    :=   '/  \';
   arr[3*a]      :=   '\__/';
end;
procedure win_or_block(a,b,c : integer);
begin
   if (arr[3*a-1] = check) and (arr[3*b-1] = check) and (arr[3*c-1] = '    ')
      then begin
         take_point(c);
         if check = oh
            then
               cannot_win := false
            else
               cannot_block := false;
               end
      else
         if (arr[3*a-1] = check) and (arr[3*b-1] = '    ') and (arr[3*c-1] = check)
            then begin
               take_point(b);
               if check = oh
                  then
                     cannot_win := false
                  else
                     cannot_block := false;
                     end
      else
         if (arr[3*a-1] = '    ') and (arr[3*b-1] = check) and (arr[3*c-1] = check)
            then begin
               take_point(a);
               if check = oh
                  then
                     cannot_win := false
                  else
                     cannot_block := false;
            end;
end; { win_or_block }
procedure three_in_a_row;
begin
   win_or_block(1,2,3);
   if cannot_win and cannot_block
      then
         win_or_block(4,5,6);
   if cannot_win and cannot_block
      then
         win_or_block(7,8,9);
   if cannot_win and cannot_block
      then
         win_or_block(1,4,7);
   if cannot_win and cannot_block
      then
         win_or_block(2,5,8);
   if cannot_win and cannot_block
      then
         win_or_block(3,6,9);
   if cannot_win and cannot_block
      then
         win_or_block(1,5,9);
   if cannot_win and cannot_block
      then
         win_or_block(7,5,3);
end; { three_in_a_row }
procedure random_corner;
begin
   move := random(10);
   while (arr[3*move-1] <> '    ') or ((move <> 1) and (move <> 3)
      and (move <> 7) and (move <> 9)) do
      move := random(10);
   take_point(move);
end; { random_corner }
procedure op_corner;
begin
   if arr[2] = oh
      then
         take_point(9);
   if arr[26] = oh
      then
         take_point(1);
   if arr[8] = oh
      then
         take_point(7);
   if arr[20] = oh
      then
         take_point(3);
end; { op_corner }
procedure check_if_oh_ex(a,b : integer);
begin
   oh_ex := false;
   if (arr[3*a-1] = oh) and (arr[3*b-1] = ex)
      then
         oh_ex := true;
end; { check_if_oh_ex }
procedure check_for_tsuke;  { Tsuke is a japanese go term which means }
begin                       { a move played adjacent to one of the    }
   tsuke := false;          { opponent's moves.                       }
   check_if_oh_ex(1,2);
   if not oh_ex
      then
         check_if_oh_ex(1,4);
   if not oh_ex
      then
         check_if_oh_ex(3,2);
   if not oh_ex
      then
         check_if_oh_ex(3,6);
   if not oh_ex
      then
         check_if_oh_ex(7,4);
   if not oh_ex
      then
         check_if_oh_ex(7,8);
   if not oh_ex
      then
         check_if_oh_ex(9,6);
   if not oh_ex
      then
         check_if_oh_ex(9,8);
   if oh_ex
      then
         tsuke := true;
end; { check_for_tsuke }
procedure make_L_shape;
var
   L_shape : boolean;
begin
   L_shape := false;
   check_if_oh_ex(1,2);
   if oh_ex
      then begin
         take_point(7);
         L_shape := true; end
       else
          check_if_oh_ex(1,4);
   if oh_ex and not L_shape
      then begin
         take_point(3);
         L_shape := true; end
      else
         check_if_oh_ex(7,8);
   if oh_ex and not L_shape
      then begin
         take_point(1);
         L_shape := true; end
      else
         check_if_oh_ex(7,4);
   if oh_ex and not L_shape
      then begin
         take_point(9);
         L_shape := true; end
      else
         check_if_oh_ex(3,2);
   if oh_ex and not L_shape
      then begin
         take_point(9);
         L_shape := true; end
      else
         check_if_oh_ex(3,6);
   if oh_ex and not L_shape
      then begin
         take_point(1);
         L_shape := true; end
      else
         check_if_oh_ex(9,8);
   if oh_ex and not L_shape
      then begin
         take_point(3);
         L_shape := true; end
      else
         check_if_oh_ex(9,6);
   if oh_ex and not L_shape
      then
         take_point(7);
end; { make_L_shape }
procedure make_T_shape;
var
   T_shape : boolean;
begin
   oh_ex := false; T_shape := false;
   check_if_oh_ex(1,8);
   if oh_ex
      then begin
         take_point(3);
         T_shape := true; end
      else
         check_if_oh_ex(3,8);
   if oh_ex and not T_shape
      then begin
         take_point(1);
         T_shape := true; end
      else
         check_if_oh_ex(3,4);
   if oh_ex and not T_shape
      then begin
         take_point(9);
         T_shape := true; end
      else
         check_if_oh_ex(9,4);
   if oh_ex and not T_shape
      then begin
         take_point(3);
         T_shape := true; end
      else
         check_if_oh_ex(7,2);
   if oh_ex and not T_shape
      then begin
         take_point(9);
         T_shape := true; end
      else
         check_if_oh_ex(9,2);
   if oh_ex and not T_shape
      then begin
         take_point(7);
         T_shape := true; end
      else
         check_if_oh_ex(1,6);
   if oh_ex and not T_shape
      then begin
         take_point(7);
         T_shape := true; end
      else
         check_if_oh_ex(7,6);
   if oh_ex and not T_shape
      then
         take_point(1);
end; { make_T_shape }
procedure computer_move;
begin
   cannot_block := true;
   if (move_counter = 2)
      then begin
         if (arr[14] = ex)
            then
               op_corner
      else begin
         if (arr[2] = ex) or (arr[8] = ex) or (arr[20] = ex)
                              or (arr[26] = ex)
            then begin
               random_corner;
               tsuke := false; end
            else begin
               check_for_tsuke;
               if tsuke
                  then
                     make_L_shape
                  else
                     make_T_shape; end; end; end
      else begin { move_counter <> 2 }
         check := oh;
         three_in_a_row; { look for a win in 1 }
         if cannot_win
            then begin { look for a block }
               check := ex;
               three_in_a_row; end;
         if cannot_win and cannot_block
            then begin
               if tsuke and (move_counter = 4)
                  then
                     take_point(5)
                  else
                     random_corner; end;
      end; { move_counter <> 2 }
   writeln('                          Hit return for computer''s move.');
   readln(enter_hit);
end; { computer_move }
procedure check_if_over;
begin
   if ((arr[2]  = oh) and (arr[5]  = oh) and (arr[8]  = oh))
   or ((arr[11] = oh) and (arr[14] = oh) and (arr[17] = oh))
   or ((arr[20] = oh) and (arr[23] = oh) and (arr[26] = oh))
   or ((arr[2]  = oh) and (arr[11] = oh) and (arr[20] = oh))
   or ((arr[5]  = oh) and (arr[14] = oh) and (arr[23] = oh))
   or ((arr[8]  = oh) and (arr[17] = oh) and (arr[26] = oh))
   or ((arr[2]  = oh) and (arr[14] = oh) and (arr[26] = oh))
   or ((arr[20] = oh) and (arr[14] = oh) and (arr[8]  = oh))
      then
         game_over := true;
end; { check_if_over }
begin { main }
   initialize;
   print_board;
   while not game_over and (move_counter < 9) do begin
      human_move;
      move_counter := move_counter + 1;
      humans_move := true;
      print_board;
      computer_move;
      move_counter := move_counter + 1;
      check_if_over;
      humans_move := false;
      if move_counter = 9
         then
            cat := true;
      print_board;
   end;
   if game_over
      then
         writeln('                                      I win.')
      else
         writeln('                                     Cat game.');
end. { program }