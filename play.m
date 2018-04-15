%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%
% This function is responsible for handling the play , it asks player 
% for the column number to place respective token, then checks if column is
% valid using a diffrent function , then places token on the board in the
% lowest unfilled row.
function board = play(player, name, board)
    % prompt user to make move
    fprintf('(player %.0f) %s make your move!\n ',player, name);
    
    % check input validity and keep asking for col number untill valid
    valid = 0;
    while ~valid
        % Ask player for column number to place token 
        fprintf('Where do you want to place the next token?\n');
        col = input('Column: ');
        % Check if column number is valid
        if validPlay(board, col)
            valid = 1;
            break;
        end
        %display error message if invalid 
        fprintf('Invalid choice. Please choose again.\n');
    end
    
    % Place chip in respective column based on lowest unfilled row
    
    %if the entire row is empty -- token will be in last row of chosen column
    if 1&& all( board(:,col) == 0)
         board(6, col) = player;
    else
    %if column not empty check for lowest unfilled row in that column and
    %place token there
        for i=5:-1:1
            if  board(i, col)==0
                 board(i, col)=player;
                 break
            end
        end
    end
    
        
   
end