%k�yd��n l�pi taulukon bin��rimuuttujat ja poistetaan sarakkeet, jos
%kyseist� kategoriaa/mekanismia/tms ei ole suosituimman 100 pelin joukossa.
%Lis�ksi kyseiset muuttujanimet ker�t��n listalle.

suos_cell = tablescombined1105{:,13};
%etsit��n suosittujen pelien indeksit
I = find(suos_cell==1);
% muutetaan cell arrayksi table
C = table2cell(tablescombined1105);
% otetaan erilliseen taulukkoon vain bin��riarvot
C1 = cell2mat(C(:,13:95));
%tehd��n tyhj� aputaulukko
C2 = zeros(1,83)

% tutkitaan montako suosittua peli� on kussakin muuttujassa
for i = 1:99
    ind = I(i,1);
    for j = 1:82
        if C1(ind,j) == 1
            C2(1,j) = C2(1,j) + 1;
        end
    end
end

% aputaulukossa C2 on t�ll� hetkell� 0 niiden pelien kohdalla, joilla
% muuttujassa ei ole yht��n suosittua peli�. Etsit��n n�iden indeksit
C3 = C2';
I2 = find(C3==0);

%n�ihin indekseihin kun lis�t��n kuhunkin 13, saadaan indeksi jolla
%sijaitsee taulukossa, joka sis�lt�� kaiken datan
for i = 1:8
     I2(i,1) = I2(i,1) + 13;
end

%lista bin��rimuuttujista, joita ei esiinny suosituimman sadan pelin
%joukossa: mChitPullSystem, mPaperAndPencil, mRockPaperScissors, cBook,
%cChildrensGame, cElectronic, cHumor, cPrintAndPlay

% poistetaan I2 - indekseiss� olevat sarakkeet taulusta:
tablescombined1105(:,I2) = [];