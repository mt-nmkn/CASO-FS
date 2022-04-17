
clc
  clear all
%% Initialization
% -------------breast-cancer -------------
%   load breast-cancer-wisconsin.data
%   b=breast_cancer_wisconsin(:,1:6);
%   c=breast_cancer_wisconsin(:,8:end);
%   main_data=[b c];
% main_data1=main_data(:,[3 4 6 7 10]); %RF
% main_data2=main_data(:,[2 4 7 9 10]); %Our

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
% main_data1=main_data(:,[21 22 36]); %RF
% main_data2=main_data(:,[21 22 36]); %Our
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
% main_data1=main_data(:,[5 15 91 93 103 177 197 224 226 228 257 259 260 267 279 280]); %RF
% main_data2=main_data(:,[5 7 8 15 31 34 86 93 95 114 123 132 141 155 257 280]); %Our
% %   -------------Hill_Valley-----------
%     load D:\arshad\idea\hilly\Hill_Valley_without_noise_Training.data
%     load D:\arshad\idea\hilly\Hill_Valley_without_noise_Testing.data
%     main_data=[Hill_Valley_without_noise_Training;Hill_Valley_without_noise_Testing];
%----------------------Hill_Valley with noise--------------------------------
%  load D:\arshad\idea\hilly\Hill_Valley_with_noise_Training.data
%  load D:\arshad\idea\hilly\Hill_Valley_with_noise_Testing.data
%  main_data=[Hill_Valley_with_noise_Training;Hill_Valley_with_noise_Testing];
%  main_data1=main_data(:,[1 3 4 5 7 8 17 19 22 23 30 33 39 47 52 55 67 68 81 86 96 97 99 100 101]); %RF
%  main_data2=main_data(:,[1 2 3 5 8 9 10 11 19 22 23 33 38 41 48 54 64 72 82 84 85 97 99 100 101]); %Our
%----------------wine-----------
% load D:\arshad\Data\wine\wine.data
% wine(:,15)=wine(:,1);
% wine(:,1:13)=wine(:,2:14);
% wine(:,14)=wine(:,15);
% main_data=wine(:,1:end-1);
% main_data1=main_data(:,[7 10 12 13 14]); %RF
% main_data2=main_data(:,[1 10 12 13 14]); %Our
% -----------ionosphere-------------
% load D:\arshad\idea\hilly\ionosphere.data
% main_data=ionosphere;
% main_data1=main_data(:,[3 4 5 6 7 8 16 27 35]); %RF
% main_data2=main_data(:,[1 4 5 7 8 12 15 31 35]); %Our
% -----------segmentation------------
load segmentation.data
segmentation(:,21)=segmentation(:,1);
segmentation(:,1:19)=segmentation(:,2:20);
segmentation(:,20)=segmentation(:,21);
main_data=segmentation(:,1:end-1);
load segmentation.test
segmentation(:,21)=segmentation(:,1);
segmentation(:,1:19)=segmentation(:,2:20);
segmentation(:,20)=segmentation(:,21);
main_data(211:2310,:)=segmentation(:,1:end-1);
main_data1=main_data(:,[2 10 11 12 16 17 19 20]); %RF
main_data2=main_data(:,[1 2 10 12 16 18 19 20]); %Our
% -------------WBC---------------
% load D:\arshad\Data\breast-cancer-wisconsin(WBC)\breast-cancer-wisconsin.data
% main_data=breast_cancer_wisconsin;
%---------------Isolet------------------
% load isolet1+2+3+4.data
% main_data=isolet1_2_3_4;
% load isolet5.data
% main_data=isolet5;
% main_data1=main_data(:,[9 10 11 15 16 17 38 70 71 106 107 109 136 137 138 139 140 141 142 162 167 170 171 172 174 176 181 198 200 201 205 211 213 214 234 265 266 297 299 301 322 326 361 362 363 385 386 388 389 390 391 392 393 394 395 396 397 398 411 412 413 414 415 416 417 418 419 424 425 426 427 454 457 458 459 460 461 462 480 481 482 489 513 514 515 517 518 519 525 548 549 581 584 585 618]); %RF
% main_data2=main_data(:,[1 2 3 4 5 6 7 8 9 10 11 12 13 18 20 21 22 27 28 29 33 38 39 46 48 51 52 65 68 70 72 82 85 90 100 101 105 108 109 112 117 127 135 138 151 160 166 171 180 182 194 195 196 201 209 227 230 235 253 254 268 269 271 273 278 279 284 292 295 297 306 322 327 331 340 342 356 362 373 394 416 419 421 449 488 513 525 526 574 585 586 593 600 607 618]); %Our
%-------------glass-------------
% load D:\arshad\Data\glass\glass.data
% main_data=glass(:,2:end);
% main_data1=main_data(:,[1 2 3 4 6 7 10]); %RF
% main_data2=main_data(:,[1 3 4 5 6 8 10]); %Our
%----------heart--------
% load heart.dat
% main_data=heart;
% main_data1=main_data(:,[8 10 12 13 14]); %RF
% main_data2=main_data(:,[2 3 12 13 14]); %Our
%------------sonar--------
% load sonar.all-data
% main_data=sonar;
% main_data1=main_data(:,[9 10 11 12 13 51 61]); %RF
% main_data2=main_data(:,[1 10 11 12 37 48 61]); %Our
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
%-----------------german------------------------
% load D:\arshad\idea\german.data-numeric
% main_data=german;
% main_data1=main_data(:,[1 3 4 5 8 9 10 11 12 13 25]); %RF
% main_data2=main_data(:,[1 2 3 4 5 9 16 17 19 20 25]); %Our
%---------------Isolet------------------
% load isolet1+2+3+4.data
% main_data=isolet1_2_3_4;
% load isolet5.data
% main_data=isolet5;
%---------------musk1---------------------
% load D:\arshad\idea\musk\clean1.data
% main_data=clean1;
% main_data1=main_data(:,[1 4 7 22 37 38 44 69 71 84 85 93 98 110 113 127 142 149 150 163 168]); %RF
% main_data2=main_data(:,[1 2 3 13 15 18 19 22 25 35 36 45 50 51 52 60 64 87 91 114 122 163 168]); %Our
%--------------dsynthetic data---------------
%  load C:\Users\moti\Desktop\code\synthetic.mat
%  main_data=synthetic;
%-----------------------------------------------
 ll=2;
[x1,y1]=size(main_data1);
[x2,y2]=size(main_data2);
% besta=zeros(ll,y-1);
bestaac1=zeros(ll,1);
bestaac2=zeros(ll,1);

bestcal1=zeros(ll,3);
bestcal2=zeros(ll,3);
% bestitera=zeros(ll,1);
tima=zeros(ll,1);
for kkk=1:ll
    kkk
    tic
percent_train=0.75;
%% data prepareation
[Num_samples,Num_Features1]=size(main_data1);
[Num_samples,Num_Features2]=size(main_data2);

Num_Features1=Num_Features1-1;
Num_Features2=Num_Features2-1;


r = randperm(Num_samples);
indTr = r(round(1:Num_samples*percent_train));
indTe = r(round(Num_samples*percent_train)+1:end);

traindata1=main_data1(indTr,[1:Num_Features1]);
traindata2=main_data2(indTr,[1:Num_Features2]);

gtrain1=main_data1(indTr,[Num_Features1+1]);
gtrain2=main_data2(indTr,[Num_Features2+1]);

testdata1=main_data1(indTe,[1:Num_Features1]);
testdata2=main_data2(indTe,[1:Num_Features2]);


gtest1=main_data1(indTe,[Num_Features1+1]);
gtest2=main_data2(indTe,[Num_Features2+1]);
 
% message='***************************All Features**************************'
ComputeSVM1 = fitcecoc(traindata1',gtrain1','ObservationsIn','columns','Coding','onevsall'); 
inFitValSVM1 = resubLoss(ComputeSVM1);
[cvSVM1] = predict(ComputeSVM1,testdata1);
Acc_All_Features1 = (sum(cvSVM1 == gtest1))/length(cvSVM1)
[Recall1,Precision1,F_score1]=cal(cvSVM1,gtest1);

ComputeSVM2 = fitcecoc(traindata2',gtrain2','ObservationsIn','columns','Coding','onevsall'); 
inFitValSVM2 = resubLoss(ComputeSVM2);
[cvSVM2] = predict(ComputeSVM2,testdata2);
Acc_All_Features2 = (sum(cvSVM2 == gtest2))/length(cvSVM2)
[Recall2,Precision2,F_score2]=cal(cvSVM2,gtest2);



%   besta(kkk,:)=Best_winner;
 bestaac1(kkk,:)=Acc_All_Features1;
%  bestitera(kkk,:)=Best_iteration;
 bestcal1(kkk,1)=Recall1;
 bestcal1(kkk,2)=Precision1;
 bestcal1(kkk,3)=F_score1;
 
 bestaac2(kkk,:)=Acc_All_Features2;
%  bestitera(kkk,:)=Best_iteration;
 bestcal2(kkk,1)=Recall2;
 bestcal2(kkk,2)=Precision2;
 bestcal2(kkk,3)=F_score2;
 
%  tima(kkk,:)=time;
end