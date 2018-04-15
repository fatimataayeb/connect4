%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%
%this function checks if column entered is valid and within range 
function valid = validPlay(board, col)
    valid = 0;
    % Check if it is an integer
    if  rem(col, 1) == 0
        % Check if it is within range
        if col > 0 && col <= 7
            % Check if position dosen't already exist
            for i=1:6
                if ~board(i, col)
                end
            end
                    valid = 1;
        end
    end
end
