% k‰ytet‰‰n alkuper‰ist‰ dataa koska k‰sitelt‰v‰t rivit
% poistuneet datasta jossain vaiheessa

taulu=readtable('cleanData.csv');

%arvostelum‰‰r‰ cut
poistettavat = taulu.usersrated<100;
taulu(poistettavat,:) =[];

suggestedPlayersN=taulu(:,contains(taulu.Properties.VariableNames,'suggested'))
suggestedPlayersN(:,'suggestedPlayerAge')=[];
suggestedPlayersN(:,'suggestedOver10player')=[];  % t‰m‰n arvot eiv‰t j‰rkevi‰ verrattuna muiden arvoihin

% PCA 
% tested PCA and found it not satisfying for our purposes

%suggestedArray=table2array(suggestedPlayersN)
%old=["null","NotRecommended","Recommended","Best"];
%new=["0","0.33","0.67","1"];
%numberArray=replace(suggestedArray,old,new);
%numberArray=str2double(numberArray);

%[mapped,mapdata] = pcacalculator(numberArray,0.75);

% PCA testing end
name = taulu.name;
pelaajia1 = (strcmp(taulu.suggested1player,'Recommended')| strcmp(taulu.suggested1player,'Best'));
pelaajia2 = (strcmp(taulu.suggested2player,'Recommended')| strcmp(taulu.suggested2player,'Best'));
pelaajia3tai4 = (strcmp(taulu.suggested3player,'Recommended')| strcmp(taulu.suggested3player,'Best')|strcmp(taulu.suggested4player,'Recommended')| strcmp(taulu.suggested4player,'Best'));
pelaajiaYli4=(strcmp(taulu.suggested5player,'Recommended')| ...
    strcmp(taulu.suggested5player,'Best')|strcmp(taulu.suggested6player,'Recommended')...
  | strcmp(taulu.suggested6player,'Best')|strcmp(taulu.suggested7player,'Recommended')...
  | strcmp(taulu.suggested7player,'Best')|strcmp(taulu.suggested8player,'Recommended')...
  | strcmp(taulu.suggested8player,'Best')|strcmp(taulu.suggested9player,'Recommended')...
  | strcmp(taulu.suggested9player,'Best')|strcmp(taulu.suggested10player,'Recommended')...
  | strcmp(taulu.suggested10player,'Best'));

pelaajat = table(name, pelaajia1, pelaajia2, pelaajia3tai4, pelaajiaYli4);

writetable(pelaajat,'pelaajienlkm.csv');