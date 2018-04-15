%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%

% This function is responsible for displaying the game board to the screen by
% scanning each entry of the board matrix that contains 0's ,1's and 2's , 
% when seeing a '0' the function displays a '0'denoting an empty space //
% when seeing a '1' in the board ,function displays 'P1' denoting player
% 1's token // when seeing a '2' , the function displays 'C' or 'P2'
% de[ending on the charecter passed to the function from the main connect 4
% m-file.
% the functions also displays column headers and dividers for graphical
% purpouses. 
function displayBoard(board, player1_char, player2_char)
    % Column Headers
    fprintf('    1    2    3    4    5    6    7\n');
    fprintf('________________________________________\n');
    
    % itierate over rows and columns
    for row = 1:6
        %add space before first col for visiual purpouses
        fprintf('  ');
        
        for col = 1:7
            % Determine character to use for position
            value = board(row, col);
            %if the entry at the board matrix is a '0' display a '0' to 
            %denote an  empty space
            if value == 0
                char = '0';
            %if the value of the entry of the board matrix is a '1' 
            %diplay player's 'token'-- 'P1'
            elseif value == 1
                char = player1_char;
            else
            %if the entry of the board matrix is not a '0' or '1' , must be
            %'2' , then display player 2's charecter ---'P2' if PvP mode
            %and 'C' if PvC mode.
                char = player2_char;
            end
            
            % Print respective character in correct position 
            fprintf('%3s', char);
            fprintf('  ');
        end
        
        % Display row labels with left divider
        fprintf(' |  \n');
    end
end