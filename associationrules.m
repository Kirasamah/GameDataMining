%% ASSOCIATION RULE MINING
minSup = 20/99; % Min support
minConf = 1/3; % Min confidence  
nRules = 500; % Maximal number of rules generated
sortFlag = 1; % Sort the rules according to support level (2 for condidence)

tablescombined1105 = sortrows(tablescombined1105,'suos_cell','descend');
tablescombined11051 = tablescombined1105(1:99,1:95);
tablescombined110511 = tablescombined11051(:,14:95);

% Create strings for item names for printing the rules into the output file
labels = tablescombined110511.Properties.VariableNames;
BinaryInputs = table2array(tablescombined110511);
% Construct a filename for outputting the rules
fname = ['Rules-Minsup-' num2str(minSup) '-minConf-' num2str(minConf)];

% Compute the rules
[Rules FreqItemsets] = findRules(BinaryInputs, minSup, minConf, nRules, sortFlag, labels, fname)

% Open the output file and interprete the results, change min-sup/min-conf
% levels etc..