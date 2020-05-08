taulu=readtable('cleanData.csv');
%arvostelumäärä cut
poistettavat = taulu.usersrated<100;
taulu(poistettavat,:) =[];
name = taulu.name;

peliaikaAlle30min = taulu.playtime<31;
peliaika31to60min = (taulu.playtime>30&taulu.playtime<61);
peliaika1hto2h = (taulu.playtime>60&taulu.playtime<121);
peliaikayli2h = taulu.playtime>120;

peliajat = table(name,peliaikaAlle30min,peliaika31to60min,peliaika1hto2h,peliaikayli2h);
writetable(peliajat,'peliaika.csv');