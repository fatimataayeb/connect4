%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%
% this function checks if the possible winning  moves suggested by the
% makeMove function( i.e Computer's move) are valid , unlike the validPlay()
% function this function takes in columns AND rows to ensure move is not out
% of range
function valid = validCompPlay(board, row, col)
    valid = 0;
    % Check if they're integers
    if rem(row, 1) == 0 && rem(col, 1) == 0
        % Check if they're within range
        if row > 0 && col > 0 && row <= 6 && col <= 7
            % Check if position don't already exist
            if ~board(row, col)
                % Check if position is on bottom or on top of other position
                if row == 6 || board(row+1, col)
                    valid = 1;
                end
            end
        end
    end
end