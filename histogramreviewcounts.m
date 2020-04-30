taulu=readtable('cleanData.csv');    %avataan siivottu data
counts=taulu.('usersrated');         %valitaan pelk‰st‰‰n rating-m‰‰r‰t
max=max(counts);                     %maksimim‰‰r‰ arvosteluja
min=min(counts);                     %minimim‰‰r‰
histo=histogram(counts,max-min+1);   %histogrammi
numberOfreviewsSorted=sort(counts,'descend'); %array, jossa rivinumero = lkm pelej‰ joilla arvon verran arvosteluja
