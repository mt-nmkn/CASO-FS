 function [traindata,testdata,gtrain,gtest]=kfold(data)
% clc
% clear all
% load AMLALL_Total.dbc
% data(:,7131)=data(:,1);
% data(:,1:7129)=data(:,2:7130);
% data(:,7130)=data(:,7131);
% main_data=data(:,1:end-1);
main_data=data;
[Num_samples,Num_Features]=size(main_data);
c = cvpartition(Num_samples,'KFold',10)
set1 = training(c,1);
set2 = training(c,2);
set3 = training(c,3);
set4 = training(c,4);
set5 = training(c,5);
set6 = training(c,6);
set7 = training(c,7);
set8 = training(c,8);
set9 = training(c,9);
set10 = training(c,10);
ntrain=sum(set1)+sum(set2)+sum(set3)+sum(set4)+sum(set5)+sum(set6)+sum(set7)+sum(set8)+sum(set9)+sum(set10);
traindata=zeros(ntrain,Num_Features);
ind_traindata = [set1,set2,set3,set4,set5,set6,set7,set8,set9,set10];
[Num_samples,Num_set]=size(ind_traindata);
ii=1;
for i=1:Num_set
    for k=1:Num_samples
        if (ind_traindata(k,i)==1)
            traindata(ii,:)=main_data(k,:);
            ii=ii+1;
        end
    end
end
gtrain=traindata(:,end);
traindata=traindata(:,1:end-1);
fold1 = test(c,1);
fold2 = test(c,2);
fold3 = test(c,3);
fold4 = test(c,4);
fold5 = test(c,5);
fold6 = test(c,6);
fold7 = test(c,7);
fold8 = test(c,8);
fold9 = test(c,9);
fold10 = test(c,10);
ntest=sum(fold1)+sum(fold2)+sum(fold3)+sum(fold4)+sum(fold5)+sum(fold6)+sum(fold7)+sum(fold8)+sum(fold9)+sum(fold10);
testdata=zeros(ntest,Num_Features);
ind_testdata = [fold1,fold2,fold3,fold4,fold5,fold6,fold7,fold8,fold9,fold10];
jj=1;
for i=1:Num_set
    for k=1:Num_samples
        if (ind_testdata(k,i)==1)
            testdata(jj,:)=main_data(k,:);
            jj=jj+1;
        end
    end
end
gtest=testdata(:,end);
testdata=testdata(:,1:end-1);

 end