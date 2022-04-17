
clc
  clear all
%% Initialization
% -------------breast-cancer -------------
%   load breast-cancer-wisconsin.data
%   b=breast_cancer_wisconsin(:,1:6);
%   c=breast_cancer_wisconsin(:,8:end);
%   main_data=[b c];
%-------------Monk-1-----------------------
% load D:\arshad\idea\hilly\monks-1.train
% monks_1(:,8)=monks_1(:,1);
% main_data=monks_1(:,2:end);
%-------------Monk-2-----------------------
% load D:\arshad\idea\hilly\monks-2.train
% monks_2(:,8)=monks_2(:,1);
% main_data=monks_2(:,2:end);
%-------------lymphography -------------
%      load C:\Users\moti\Desktop\idea\hilly\lymphography.data
%      data=lymphography;
%      label=data(:,1);
%      main_data=data(:,2:end);
%      main_data=[main_data label];
%-------------soybean-small -------------
%    load D:\arshad\idea\hilly\soybean-small.data
%    main_data=soybean_small;
  %-------------arrhythmia -------------
%   load D:\arshad\idea\hilly\arrhythmia_missed_99.99.data
%   d=arrhythmia_missed_99_99;
%   ave=mean(d);
%   [m,n]=size(d);
%   for i=1:m
%       for j=1:n
%           if (d(i,j)==-99.99)
%               d(i,j)=ave(j);
%           end
%       end
%   end
%   main_data=d;
% %   -------------Hill_Valley-----------
% load D:\arshad\idea\hilly\Hill_Valley_without_noise_Training.data
% load D:\arshad\idea\hilly\Hill_Valley_without_noise_Testing.data
% main_data=[Hill_Valley_without_noise_Training;Hill_Valley_without_noise_Testing];
%----------------------Hill_Valley with noise--------------------------------
%  load D:\arshad\idea\hilly\Hill_Valley_with_noise_Training.data
%  load D:\arshad\idea\hilly\Hill_Valley_with_noise_Testing.data
%  main_data=[Hill_Valley_with_noise_Training;Hill_Valley_with_noise_Testing];
%   -------------wine-----------
% load D:\arshad\Data\wine\wine.data
% wine(:,15)=wine(:,1);
% wine(:,1:13)=wine(:,2:14);
% wine(:,14)=wine(:,15);
% main_data=wine(:,1:end-1);
%---------------Isolet------------------
% load D:\arshad\idea\isolet1+2+3+4.data
% main_data=isolet1_2_3_4;
% load D:\arshad\idea\isolet5.data
% main_data=isolet5;
%-------------german-----------
% load D:\arshad\idea\german.data-numeric
% main_data=german;
% -----------ionosphere-------------
% load D:\arshad\idea\hilly\ionosphere.data
% main_data=ionosphere;
% -----------segmentation------------
% load segmentation.data
% segmentation(:,21)=segmentation(:,1);
% segmentation(:,1:19)=segmentation(:,2:20);
% segmentation(:,20)=segmentation(:,21);
% main_data=segmentation(:,1:end-1);
% load segmentation.test
% segmentation(:,21)=segmentation(:,1);
% segmentation(:,1:19)=segmentation(:,2:20);
% segmentation(:,20)=segmentation(:,21);
% main_data(211:2310,:)=segmentation(:,1:end-1);
% -------------WBC---------------
% load D:\arshad\Data\breast-cancer-wisconsin(WBC)\breast-cancer-wisconsin.data
% main_data=breast_cancer_wisconsin;
%---------------Isolet------------------
% load isolet1+2+3+4.data
% main_data=isolet1_2_3_4;
% load isolet5.data
% main_data=isolet5;
%-------------glass-------------
% load D:\arshad\Data\glass\glass.data
% main_data=glass(:,2:end);
%----------heart--------
load heart.dat
main_data=heart;
%------------sonar--------
% load sonar.all-data
% main_data=sonar;
%--------vowel-----------
%   load vowel.data
%   for n = 0:89
%     vowel(1+n*11,11)=1;
%     vowel(2+n*11,11)=2;
%     vowel(3+n*11,11)=3;
%     vowel(4+n*11,11)=4;
%     vowel(5+n*11,11)=5;
%     vowel(6+n*11,11)=6;
%     vowel(7+n*11,11)=7;
%     vowel(8+n*11,11)=8;
%     vowel(9+n*11,11)=9;
%     vowel(10+n*11,11)=10;
%     vowel(11+n*11,11)=11;
%   end
%   main_data=vowel;
%----------------leukemia-------------
% load AMLALL_Train.dbc
%  load DLBCLTumor.dbc
% load SRBCT.arff
% data=SRBCT;
% %  data=DLBCLTumor;
% % data=AMLALL_Total;
% [traindata,testdata,gtrain,gtest]=kfold(data);
% main_data= traindata;
% % main_data(end+1:end+72,:)=testdata;
% % % dlb main_data(end+1:end+77,:)=testdata;
% main_data(end+1:end+83,:)=testdata;
% labels=gtrain;
% % labels(end+1:end+72,:)=gtest;
% labels(end+1:end+83,:)=gtest;
% main_data(:,end+1)=labels;
% [Num_samples,Num_Features]=size(main_data);
% Num_Features=Num_Features-1;
% % indTr = zeros(1,648);
% % indTr = zeros(1,693);
% indTr = zeros(1,747);
% for i=1:747
%     indTr(1,i)=i;
% end
% indTe = zeros(1,83);
% for i=1:83
%     indTe(1,i)=747+i;
% end
%-------------------------------
% load LSTV.csv
% main_data=LSTV;
%-----------------------------------------
% ---------------musk1---------------------
% load D:\arshad\idea\musk\clean1.data
% main_data=clean1;
%--------------dsynthetic data---------------
%  load D:\arshad\idea\code\synthetic.mat
%  main_data=synthetic;
%-----------------------------------------------
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
tic
message='***************************GA-SVM**************************'
Generation=20;
[Feat_Index, BestAccuracy, AllChromosomes, AllScores] =Feature_Selection_GA('SVM', main_data,Num_Features,Generation,indTr,indTe);
Accuracy=(1-BestAccuracy)*100
traindata=main_data(indTr,Feat_Index);
testdata=main_data(indTe,Feat_Index);
ComputeSVM = fitcecoc(traindata',gtrain','ObservationsIn','columns','Coding','onevsall'); 
inFitValSVM = resubLoss(ComputeSVM);
[cvSVM] = predict(ComputeSVM,testdata);
Acc = (sum(cvSVM == gtest))/length(cvSVM)
[Recall,Precision,F_score]=cal(cvSVM,gtest);
time=toc