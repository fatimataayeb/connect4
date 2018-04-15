%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%
%This function reads the files in the scores.txt file then displays it in a
%table form. 
function viewScores()
%check if the file exists , the function exist returns 2 if true
e=exist('scores.txt');
%if file exists read data from file 
if e==2
    %open file for reading 
    fid = fopen('scores.txt', 'r');
    %save data in a cell 
    C=textscan(fid,'%15s\n%6s\n');
    %convert cell for easier handeling
    A=[C{:}];
    A=A';
    %display table headers
    disp('-------------------------------------')
    fprintf('%15s\t\t%6s\n','NAME','SCORE')
    disp('-------------------------------------')
    %loop over contents of cell A and display them 
    for i=1:2:2*length(A)

        fprintf('%15s\t\t%6s\n',A{i},A{i+1});
    end
    fclose(fid);
else
    %if file does not exist display the following message
    disp('NO SCORES TO DISPLAY IN THE MOMENT\n');
    disp('PLAY A BIT THEN COME CHECK YOUR SCORE :D\n');
        
end
    %wait for 5 seconds then display main menu again. 
    pause(5)
    connect4
end