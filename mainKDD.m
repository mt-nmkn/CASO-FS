clc
  clear all

%% Initialization
%--------------- KDD------------
load KDDTrain+.txt
main_data=KDDTrain_(:,1:41);
main_data=[main_data KDDTrain_(:,43)];
main_data=[main_data KDDTrain_(:,42)];
[d1,d2]=size(main_data);
main_data1=main_data;
main_data2=main_data;
main_data3=main_data;
main_data4=main_data;
for ik=1:d1
    if (main_data1(ik,end)~=0)
        main_data1(ik,end)=1;
    end
end
%-----------------------------------------
for ik=1:d1
    if (main_data2(ik,end)~=1)
        main_data2(ik,end)=0;
    end
end
%-----------------------------------------
for ik=1:d1
    if (main_data3(ik,end)~=2)
        main_data3(ik,end)=0;
    end
end
%-----------------------------------------
for ik=1:d1
    if (main_data4(ik,end)~=4)
        main_data4(ik,end)=0;
    end
end
%-----------------------------------------

DDD_dos=[];
accc_dos=[];
DDD_probe=[];
accc_probe=[];
DDD_rl=[];
accc_rl=[];
DDD_ur=[];
accc_ur=[];
 ll=10;
 %--------------------------------------------------dos-----------------------------------
[x,y]=size(main_data1);
besta_dos=zeros(ll,y-1);
bestaac_dos=zeros(ll,1);
bestcal_dos=zeros(ll,3);
bestitera_dos=zeros(ll,1);
tima_dos=zeros(ll,1);
for kkk=1:ll
    kkk
percent_train=0.75;
%% data prepareation
[Num_samples,Num_Features]=size(main_data1);
Num_Features=Num_Features-1;
r = randperm(Num_samples);
indTr = r(round(1:Num_samples*percent_train));
indTe = r(round(Num_samples*percent_train)+1:end);
traindata=main_data1(indTr,[1:Num_Features]);
gtrain=main_data1(indTr,[Num_Features+1]);
testdata=main_data1(indTe,[1:Num_Features]);
gtest=main_data1(indTe,[Num_Features+1]);

%% CompactGA
tic
message='***************************Proposed Method**************************'

Np=0.01;
Max_iter=100;
m=22;
%   m=round(Num_Features/2);
%  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score,DD]=idear2(main_data,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);
  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score]=idearKDD(main_data1,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);

time=toc;
% DDD=[DDD DD];
% accc=[accc acc_report];
 besta_dos(kkk,:)=Best_winner;
 bestaac_dos(kkk,:)=Best_Acc;
 bestitera_dos(kkk,:)=Best_iteration;
 bestcal_dos(kkk,1)=Best_Recall;
 bestcal_dos(kkk,2)=Best_Precision;
 bestcal_dos(kkk,3)=Best_F_score;
 tima_dos(kkk,:)=time
% besta(kkk,end+1)=sum(Best_winner)
% Best_Acc



end
%-----------------------------------------probe------------------------------
[x,y]=size(main_data2);
besta_probe=zeros(ll,y-1);
bestaac_probe=zeros(ll,1);
bestcal_probe=zeros(ll,3);
bestitera_probe=zeros(ll,1);
tima_probe=zeros(ll,1);
for kkk=1:ll
    kkk
percent_train=0.75;
%% data prepareation
[Num_samples,Num_Features]=size(main_data2);
Num_Features=Num_Features-1;
r = randperm(Num_samples);
indTr = r(round(1:Num_samples*percent_train));
indTe = r(round(Num_samples*percent_train)+1:end);
traindata=main_data2(indTr,[1:Num_Features]);
gtrain=main_data2(indTr,[Num_Features+1]);
testdata=main_data2(indTe,[1:Num_Features]);
gtest=main_data2(indTe,[Num_Features+1]);

%% CompactGA
tic
message='***************************Proposed Method**************************'

Np=0.01;
Max_iter=100;
m=22;
%   m=round(Num_Features/2);
%  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score,DD]=idear2(main_data,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);
  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score]=idearKDD(main_data2,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);

time=toc;
% DDD=[DDD DD];
% accc=[accc acc_report];
 besta_probe(kkk,:)=Best_winner;
 bestaac_probe(kkk,:)=Best_Acc;
 bestitera_probe(kkk,:)=Best_iteration;
 bestcal_probe(kkk,1)=Best_Recall;
 bestcal_probe(kkk,2)=Best_Precision;
 bestcal_probe(kkk,3)=Best_F_score;
 tima_probe(kkk,:)=time
% besta(kkk,end+1)=sum(Best_winner)
% Best_Acc



end
%----------------------------------rl------------------------------------------------
[x,y]=size(main_data3);
besta_rl=zeros(ll,y-1);
bestaac_rl=zeros(ll,1);
bestcal_rl=zeros(ll,3);
bestitera_rl=zeros(ll,1);
tima_rl=zeros(ll,1);
for kkk=1:ll
    kkk
percent_train=0.75;
%% data prepareation
[Num_samples,Num_Features]=size(main_data3);
Num_Features=Num_Features-1;
r = randperm(Num_samples);
indTr = r(round(1:Num_samples*percent_train));
indTe = r(round(Num_samples*percent_train)+1:end);
traindata=main_data3(indTr,[1:Num_Features]);
gtrain=main_data3(indTr,[Num_Features+1]);
testdata=main_data3(indTe,[1:Num_Features]);
gtest=main_data3(indTe,[Num_Features+1]);

%% CompactGA
tic
message='***************************Proposed Method**************************'

Np=0.01;
Max_iter=100;
m=22;
%   m=round(Num_Features/2);
%  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score,DD]=idear2(main_data,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);
  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score]=idearKDD(main_data3,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);

time=toc;
% DDD=[DDD DD];
% accc=[accc acc_report];
 besta_rl(kkk,:)=Best_winner;
 bestaac_rl(kkk,:)=Best_Acc;
 bestitera_rl(kkk,:)=Best_iteration;
 bestcal_rl(kkk,1)=Best_Recall;
 bestcal_rl(kkk,2)=Best_Precision;
 bestcal_rl(kkk,3)=Best_F_score;
 tima_rl(kkk,:)=time
% besta(kkk,end+1)=sum(Best_winner)
% Best_Acc



end
%----------------------------------ur----------------------------------------
[x,y]=size(main_data4);
besta_ur=zeros(ll,y-1);
bestaac_ur=zeros(ll,1);
bestcal_ur=zeros(ll,3);
bestitera_ur=zeros(ll,1);
tima_ur=zeros(ll,1);
for kkk=1:ll
    kkk
percent_train=0.75;
%% data prepareation
[Num_samples,Num_Features]=size(main_data4);
Num_Features=Num_Features-1;
r = randperm(Num_samples);
indTr = r(round(1:Num_samples*percent_train));
indTe = r(round(Num_samples*percent_train)+1:end);
traindata=main_data4(indTr,[1:Num_Features]);
gtrain=main_data4(indTr,[Num_Features+1]);
testdata=main_data4(indTe,[1:Num_Features]);
gtest=main_data4(indTe,[Num_Features+1]);

%% CompactGA
tic
message='***************************Proposed Method**************************'

Np=0.01;
Max_iter=100;
m=22;
%   m=round(Num_Features/2);
%  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score,DD]=idear2(main_data,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);
  [Best_winner,Best_Acc,Best_iteration,PM,PV,matris,counter,Best_Recall,Best_Precision,Best_F_score]=idearKDD(main_data4,indTr,indTe,Num_Features,Num_samples,Np,Max_iter,m);

time=toc;
% DDD=[DDD DD];
% accc=[accc acc_report];
 besta_ur(kkk,:)=Best_winner;
 bestaac_ur(kkk,:)=Best_Acc;
 bestitera_ur(kkk,:)=Best_iteration;
 bestcal_ur(kkk,1)=Best_Recall;
 bestcal_ur(kkk,2)=Best_Precision;
 bestcal_ur(kkk,3)=Best_F_score;
 tima_ur(kkk,:)=time
% besta(kkk,end+1)=sum(Best_winner)
% Best_Acc



end