%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%
%QUESTION #2 ---- 
%GAME :
% Connect 4
%This is a simplified version of the famous turn-based game Connect 4 using
%Matlab.
%In this implimentation , a 6x7 Zero Array is used to represent the game
%board.There  are two modes the player can use to play with , vs another
%player or vs the computer.Letters appear in the Zero matrix denoting the
%tokens (P1 for player 1 , P2 for player two and C for Computer)
%-----------------------------%

% Clear environment
clear;
clc;
%Display Main Menu 
option=menu('Choose an option','Play','View Scores','How to Play','Quit');
switch option
    case 1
        %Display Game Modes
        mode=menu('Select game mode','Player vs Player','Player vs Computer');
        switch mode
            case'1'
                mode=1;
            case '2'
                mode=2;
        end
    case 2
        %call the viewScore function when respective button is clicked
        viewScores()
    case 3
        %display instructions then allow them to select mode 
        next=menu(' On your turn,choose which column you want your token to be placed, Take turns until 1 player gets a Connect 4 ( 4 tokens  in arow horizontally, vertically, and diagonlly).','Play');
        switch next
            case 1
                 mode=menu('Select game mode','Player vs Player','Player vs Computer');
                switch mode
                    case'1'
                        mode=1;
                    case '2'
                        mode=2;
                end
        end               
    case 4
        exit
        
end

             
% Create blank board
board = zeros(6, 7);


% Assign player token characters and ask for player names
if mode == 1
    player1_name = input('Player 1: What is your name? ', 's');
    player2_name = input('Player 2: What is your name? ', 's');
    player1_char = 'P1';
    player2_char = 'P2';
else
    player1_name = input('What is your name? ', 's');
    player2_name = 'COMPUTER';
    player1_char = 'P1';
    player2_char = 'C';
end

% Player toggle
player = 2;

% Initial result of thr game is zero
result = 0;
%Main game loop !
% While no one has one i.e // result is 0 
while ~result
    % Toggle player
    if player == 1
        player = 2;
        name = player2_name;
    else
        player = 1;
        name = player1_name;
    end
    
    % Space between turns
    fprintf('\n\n');
        
    if mode == 2 && player == 2
        % Have computer make move is mode is 2 and it's the comp's turn
        board = makeMove(board);
    else
        % Otherwise, show board and ask player to play
        displayBoard(board, player1_char, player2_char);
        board = play(player, name, board);
    end
    
    % Check if a player has won
    result = evaluateBoard(board);
end

% If there is a winner
if result == 1 || result == 2
    % Display winner and final board to users
    fprintf('\n____________________\nWINNER...%s!!!\n\n', name);
    fprintf('Final board:\n');
    displayBoard(board, player1_char, player2_char);
    saveScore(name);
    pause(2);
    option=menu('Would you like to play again?','Yes','Quit');
    switch option
        case 1
            connect4
        case 2
            exit
    end
            
    
else
    % If it was a draw.
    %display draw message and final board
    fprintf('\n____________________\nIt''s a draw!\n\n');
    fprintf('Final board:\n');
    displayBoard(board, player1_char, player2_char);
    %wait for 2 seconds then ask user if they would like to play again 
    pause(2);
    option=menu('Would you like to play again?','Yes','Quit');
    switch option
    %call connect 4 all over again and play again 
        case 1
            connect4
        case 2
    %exit matlab and close down the game
            exit
    end
end

