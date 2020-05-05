taulu=readtable('morethan100ratings.csv');     %avataan taulu
suosittu = taulu.average > 7.7 & taulu.usersrated > 2250; % valitaan ne pelit joilla alle 100 arvioita
suosittu2 = double(suosittu);
suos_cell = num2cell(suosittu2);
suosittu = cell2table(suos_cell);
taulu = [taulu suosittu];
%taulu(poistettavat,:) = [];           % poistetaan ne
writetable(taulu,'suositut.csv'); % talletetaan uuteen tiedostoon

%taulu2 = readtable('average5up.csv');
%poistettavat2 = taulu2.usersrated < 2250; % valitaan ne pelit joilla alle 100 arvioita
%taulu2(poistettavat2,:) = [];           % poistetaan ne
%writetable(taulu2,'morethan500ratings.csv');