%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%
% this function is responsible for determening if there is a winner i.e if 
% 4 tokens have been connected in a line horizintally, vertically or
% diagnoally .
function result = evaluateBoard(board)
    % Initial result 
    result = 0;
    % Check wether there is a HORIZINTAL connect-4
    %example--:
    %000*00
    %000*00
    %000*00
    %000*00
    %000000
    %000000
    %loop over rows
    for row = 1:6
        %iterate over 4 columns
        for col = 1:4
            %set each 1x4 entity of the board to a variable
            fourinrow = board(row, col:(col+3));
            
            % check if all entries of the 1x4 entity is 1 i.e-- filled with
            %player 1's tokens
            if fourinrow == 1
                %if it is set the result to 1 i.e -- player 1 won
                result = 1;
                break;
                
            % check if all entries of the 1x4 entity is 2 i.e-- filled with
            %player 2's or Computer's tokens
            elseif fourinrow == 2
                 %if it is set the result to 2 i.e--player 2 or Computer
                 %won
                result = 2;
                break;
            end
        end
    end
    
    % If there are not any horizintal connect-4s  , check for vertical
    % connect-4
    %example--:
    %000000
    %000000
    %000000
    %0****0
    %000000
    %000000
    if ~result
        %iterate over  rows
        for row = 1:3
            %lopp over all columns
            for col = 1:7
                % set the 4x1 entity of the board to a variable
                fourincol = board(row:(row+3), col);

             % check if all entries of the 4x1 entity is 1 i.e-- filled with
            %player 1's tokens
                if fourincol == 1
           %if it is set the result to 1 i.e -- player 1 won
                    result = 1;
                    break;
              % check if all entries of the 4x1 entity is 2 i.e-- filled with
            %player 2's or Computer's tokens
                elseif fourincol == 2
                %if it is set the result to 2 i.e--player 2 or Computer
                 %won
                    result = 2;
                    break;
                end
            end
        end
    end

    % check for diagonal connect-4 if there are no horizintal or vertical
    % connect4s
    %example--:
    %*00000
    %0*0000
    %00*000
    %000*00
    %000000
    %000000
    if ~result
        %loop over 1/4th of the rows
        for row = 1:3
            %loop over 1/4th of the columns
            for col = 1:4
                %set a  4x1 matrix with each entry 1 row and 1 column away
                %from the previous one (diagonal)
                diagonal = [board(row, col), board(row+1, col+1), board(row+2, col+2), board(row+3, col+3)];
                
             % check if all entries of the 4x1 entity is 1 i.e-- filled with
            %player 1's tokens
                if diagonal == 1
                    %if it is set the result to 1 i.e -- player 1 won
                    result = 1;
                    break;
                % check if all entries of the 4x1 entity is 2 i.e-- filled with
                %player 2's or Computer's tokens
                elseif diagonal == 2
                     %if it is set the result to 2 i.e--player 2 or Computer
                     %won
                    result = 2;
                    break;
                end
                
                % Get inverse diagonal
                   %EXAMPE--:
                    %0000*0
                    %000*00
                    %00*000
                    %0*0000
                    %000000
                    %000000
                diagonal = [board(7-row, col), board(6-row, col+1), board(5-row, col+2), board(4-row, col+3)];
             % check if all entries of the 4x1 entity is 1 i.e-- filled with
            %player 1's tokens
                if diagonal == 1
                    %if it is set the result to 1 i.e -- player 1 won
                    result = 1;
                    break;
                % check if all entries of the 4x1 entity is 2 i.e-- filled with
                %player 2's or Computer's tokens
                elseif diagonal == 2
                     %if it is set the result to 2 i.e--player 2 or Computer
                     %won
                    result = 2;
                    break;
                end
            end
        end
    end
    
    % If no result, check for draw (full board)
    if ~result
        % Check if number of zeros using the histc which returns a 1 if the
        % column contains a 0 , then add the number of 1's if ==o i.e NO
        % zeros then it must be a draw
        if sum(histc(board, 0)) == 0
            result = 3;
        end
    end
end