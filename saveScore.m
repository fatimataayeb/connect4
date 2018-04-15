
%-----------------------------%
%FATIMA MUTIULLAH TAYEB
%024485
%Assignment #2 
%-------------------------------%
% This functions saves the score of the winner to a .txt file.
% if the player's name does not exist in the scoreboard the score will be one ,
% otherwise the player exitst, his/her score will be updated (increase by 1). 
function saveScore(name)
%first check if the score file already exists
e=exist('scores.txt');
%if it does ,then check if the player already has a record
if e==2;
    %open file for reading 
    fid = fopen('scores.txt', 'r');
    %save text in a cell 
    C = textscan(fid, '%s', 'Delimiter', '\n');
    fclose(fid);
    % Search a specific string and find all rows containing matches
    C_contains = strfind(C{1}, name);
    rows = find(~cellfun('isempty', C_contains));
end
%if file does not exist or player does not have a previous record then save
%players name and a score of 1
if e==0||isempty(rows)
    %open file for appending 
    fileID=fopen('scores.txt','a+');
    %set score to 1 
    score='1';
    fprintf(fileID,'%15s\n%6s\r\n',name,score);
    fclose(fileID);
else
    %tranform the cell for handeling purpouses 
    A=[C{:}];
    %set new score( increase 1 of old score)and do respective data
    %conversions
    oldscore=single(A{rows+1});
    newscore=oldscore+1;
    A{rows+1}=char(newscore);
    [row,col]=size(A);
    %open file for writing to discard all previous records
    fid = fopen('scores.txt', 'w');
    %add new records to file 
    for n=1:2:row-1
        Name=A{n};
        Score=A{n+1};
        fprintf(fid,'%15s\n%6s\r\n',Name,Score );
    end
    fclose(fid);
end
    
    
    
end


    
