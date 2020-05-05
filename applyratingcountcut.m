taulu=readtable('tablescombined.csv');     %avataan taulu
poistettavat = taulu.usersrated < 100; % valitaan ne pelit joilla alle 100 arvioita
taulu(poistettavat,:) = [];           % poistetaan ne
writetable(taulu,'morethan100ratings.csv'); % talletetaan uuteen tiedostoon