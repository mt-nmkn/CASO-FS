clc
clear all
tic
%% Initialization
load australian.dat
[Num_samples,Num_Features]=size(australian);
Num_Features=Num_Features-1;
Generation=30;
[Feat_Index, BestAccuracy, AllChromosomes, AllScores] =  Feature_Selection_GA('SVM', australian,Num_Features,Generation);
Accuracy=(1-BestAccuracy)*100
