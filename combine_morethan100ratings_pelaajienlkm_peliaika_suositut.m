%importataan morethan100ratings ja suositut tai tuodaan ne muutoin
%workspaceen.

% morethan100ratings taulun korjaus, pieni moka tullut matkan varrella ja j‰‰nyt mechanic-sarake, jolloin muuttujien nime‰miset edelsiv‰t yhdell‰ sarakkeella. 
morethan100ratings = removevars(morethan100ratings, 'mActionMovementProgramming');
morethan100ratings.Properties.VariableNames{13} = 'mActionMovementProgramming';
morethan100ratings.Properties.VariableNames{14} = 'mActionPointAllowanceSystem';
morethan100ratings.Properties.VariableNames{15} = 'mAreaControlAreaInfluence';
morethan100ratings.Properties.VariableNames{16} = 'mAreaEnclosure';
morethan100ratings.Properties.VariableNames{17} = 'mAreaMovement';
morethan100ratings.Properties.VariableNames{18} = 'mAreaImpulse';
morethan100ratings.Properties.VariableNames{19} = 'mCampaignBattleCardDriven';
morethan100ratings.Properties.VariableNames{20} = 'mCardDrafting';
morethan100ratings.Properties.VariableNames{21} = 'mChitPullSystem';
morethan100ratings.Properties.VariableNames{22} = 'mDeckPoolBuilding';
morethan100ratings.Properties.VariableNames{23} = 'mDiceRolling';
morethan100ratings.Properties.VariableNames{24} = 'mGridMovement';
morethan100ratings.Properties.VariableNames{25} = 'mHandManagement';
morethan100ratings.Properties.VariableNames{26} = 'mHexAndCounter';
morethan100ratings.Properties.VariableNames{27} = 'mLineDrawing';
morethan100ratings.Properties.VariableNames{28} = 'mBusiness';
morethan100ratings.Properties.VariableNames{29} = 'mCoOp';
morethan100ratings.Properties.VariableNames{30} = 'mPatternGames';
morethan100ratings.Properties.VariableNames{31} = 'mRouteGames';
morethan100ratings.Properties.VariableNames{32} = 'mSocial';
morethan100ratings.Properties.VariableNames{33} = 'mMemory';
morethan100ratings.Properties.VariableNames{34} = 'mModularBoard';
morethan100ratings.Properties.VariableNames{35} = 'mPaperAndPencil';
morethan100ratings.Properties.VariableNames{36} = 'mPickUpAndDeliver';
morethan100ratings.Properties.VariableNames{37} = 'mPlayerElimination';
morethan100ratings.Properties.VariableNames{38} = 'mPointToPointMovement';
morethan100ratings.Properties.VariableNames{39} = 'mPressYourLuck';
morethan100ratings.Properties.VariableNames{40} = 'mRockPaperScissors';
morethan100ratings.Properties.VariableNames{41} = 'mRollSpinAndMove';
morethan100ratings.Properties.VariableNames{42} = 'mSecretUnitDeployment';
morethan100ratings.Properties.VariableNames{43} = 'mSetCollection';
morethan100ratings.Properties.VariableNames{44} = 'mSimulation';
morethan100ratings.Properties.VariableNames{45} = 'mSimultaneousActionSelection';
morethan100ratings.Properties.VariableNames{46} = 'mTilePlacement';
morethan100ratings.Properties.VariableNames{47} = 'mTrading';
morethan100ratings.Properties.VariableNames{48} = 'mVariablePhaseOrder';
morethan100ratings.Properties.VariableNames{49} = 'mVariablePlayerPowers';
morethan100ratings.Properties.VariableNames{50} = 'mVoting';
morethan100ratings.Properties.VariableNames{51} = 'mWorkerPlacement';

% otetaan suositut-taulusta suos_cell sarake ja liitet‰‰n se
% morethan100ratings -taulun kanssa tauluksi combinedPopMoreThan100
combinedPopMoreThan100 = [morethan100ratings suositut1];

%muokataan pelaajien lkm ja peliaika -tauluista name sarake pois
peliaika = removevars(peliaika, 'name');
pelaajienlkm = removevars(pelaajienlkm, 'name');

% yhdistet‰‰n ne taulut yhteen combinedPopMoreThan100 -taulun
% kanssa tauluksi combinedPop100TimePlayers
combinedPop100TimePlayers = [combinedPopMoreThan100 peliaika];
combinedPop100TimePlayers = [combinedPop100TimePlayers pelaajienlkm];

writetable(combinedPop100TimePlayers,'tablescombined_0805.csv');