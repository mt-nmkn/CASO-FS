clc
clear all

%% Initialization
%   -------------Wine Dataset-----------
load Dataset\wine.data
wine(:,15)=wine(:,1);
wine(:,1:13)=wine(:,2:14);
wine(:,14)=wine(:,15);
main_data=wine(:,1:end-1);
%%
DDD=[];
accc=[];
 N_run=10;
[x,y]=size(main_data);
besta=zeros(N_run,y-1);
bestaac=zeros(N_run,1);
bestcal=zeros(N_run,3);
bestitera=zeros(N_run,1);
for loop=1:N_run
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

%% Proposed Method
message='***************************Proposed Method**************************'
Change_factor=0.01;
Max_iter=100;
 m=round(Num_Features/2);
 [Best_winner,Best_Acc,Best_iteration,PM,PV,matrix,counter,Best_Recall,Best_Precision,Best_F_score,DD]=scfs(main_data,indTr,indTe,Num_Features,Num_samples,Change_factor,Max_iter,m);
 DDD=[DDD DD];
 besta(loop,:)=Best_winner;
 bestaac(loop,:)=Best_Acc;
 bestitera(loop,:)=Best_iteration;
 bestcal(loop,1)=Best_Recall;
 bestcal(loop,2)=Best_Precision;
 bestcal(loop,3)=Best_F_score;
end