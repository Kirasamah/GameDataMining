%k‰yd‰‰n l‰pi taulukon bin‰‰rimuuttujat ja poistetaan sarakkeet, jos
%kyseist‰ kategoriaa/mekanismia/tms ei ole suosituimman 100 pelin joukossa.
%Lis‰ksi kyseiset muuttujanimet ker‰t‰‰n listalle.

suos_cell = combinedPop100TimePlayers{:,87};
%etsit‰‰n suosittujen pelien indeksit
I = find(suos_cell==1);
% muutetaan cell arrayksi table
C = table2cell(combinedPop100TimePlayers);
% otetaan erilliseen taulukkoon vain bin‰‰riarvot
C1 = cell2mat(C(:,13:95));
%tehd‰‰n tyhj‰ aputaulukko
C2 = zeros(1,83)

% etsit‰‰n sarakkeet joissa suosittujen joukossa ei ole yht‰‰n muuttujan
% sis‰lt‰v‰‰ peli‰
for i = 2:size(I)
    ind = I(i,1);
    for j = 1:size(C2)
        ind2 = j;
      if (C1(ind,j)==1)        
          C2(1,j) = 1;
      end
    end
end

% aputaulukossa on t‰ll‰ hetkell‰ 0 niiden pelien kohdalla, joilla
% C-taulukossa suosittuja pelej‰ ei kuulu t‰h‰n ryhm‰‰n, otetaan n‰iden
% indeksit
for i = 1:83
     if (C2(1,i) == 0)
     C2ind = [C2ind,i];
     end
end

%n‰ihin indekseihin kun lis‰t‰‰n kuhunkin 12, saadaan indeksi jolla
%sijaitsee taulukossa, joka sis‰lt‰‰ kaiken datan
for i = 1:8
     C2ind(1,i) = C2ind(1,i) + 12;
end

% t‰m‰n j‰lkeen nyt n‰iss‰ indekseiss‰ olevien muuttujien nimet tulisi
% poimia combinedPopMoreThan100 taulusta ja sen j‰lken vastaavat sarakkeet
% poistaa sielt‰