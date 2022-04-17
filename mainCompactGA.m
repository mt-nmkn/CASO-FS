clc
clear all
%% Initialization
load heart.data
main_data=glass(:,2:end);
% segmentation(:,21)=segmentation(:,1);
% segmentation(:,1:19)=segmentation(:,2:20);
% segmentation(:,20)=segmentation(:,21);
% main_data=segmentation(:,1:end-1);
% load segmentation.test
% segmentation(:,21)=segmentation(:,1);
% segmentation(:,1:19)=segmentation(:,2:20);
% segmentation(:,20)=segmentation(:,21);
% main_data(211:2310,:)=segmentation(:,1:end-1);
percent_train=0.75;
%% data prepareation
[Num_samples,Num_Features]=size(main_data);
Num_Features=Num_Features-1;
r = randperm(Num_samples);
indTr = r(round(1:Num_samples*percent_train));
indTe = r(round(Num_samples*percent_train)+1:end);
traindata=main_data(indTr,[1:Num_Features]);
gtrain=main_data(indTr,[Num_Features+1]);
testdata=main_data(indTe,[1:Num_Features]);
gtest=main_data(indTe,[Num_Features+1]);
%% CompactGA
tic
message='***************************Proposed Method**************************'
Alpha=0.4;
Beta=0.6;
Np=0.05;
Max_iter=40;
[Best_winner,Best_Acc,Best_iteration]=idea(main_data,indTr,indTe,Num_Features,Num_samples,Alpha,Beta,Np,Max_iter)
num_F=sum(Best_winner)
toc
%% All Features.
tic
message='***************************All Features**************************'
ComputeSVM = fitcecoc(traindata',gtrain','ObservationsIn','columns','Coding','onevsall'); 
inFitValSVM = resubLoss(ComputeSVM);
[cvSVM] = predict(ComputeSVM,testdata);
Acc_All_Features = (sum(cvSVM == gtest))/length(cvSVM);
toc
%% GA-SVM
tic
message='***************************GA-SVM**************************'
Generation=30;
[Feat_Index, BestAccuracy, AllChromosomes, AllScores] =  Feature_Selection_GA('SVM', main_data,Num_Features,Generation);
Accuracy=(1-BestAccuracy)*100
toc