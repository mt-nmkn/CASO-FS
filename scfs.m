function[Best_winner,Best_Acc,Best_iteration,PM,PV,matrix,counter,Best_Recall,Best_Precision,Best_F_score,DD]=scfs(main_data,indTr,indTe,Num_Features,Num_samples,Np,iter,m)



    
%%
DD=[];
Best_Acc=0;
Best_winner=zeros(1,Num_Features);
Best_Recall=0;
Best_Precision=0;
Best_F_score=0;
%matris shamel tedad tekrar haye har yek az 16 halat update PM , PV ast
matrix=zeros(4,4);
m_a=round(random('chisquare',m))+1;
m_b=round(random('chisquare',m))+1;
PM=ones(Num_Features,Num_Features);
counter=zeros(Num_Features,Num_Features);
PV=ones(1,Num_Features);
% ----------generate 2 individuals----------

for l=1:iter
    iteration=l
    a=zeros(1,Num_Features);
    b=zeros(1,Num_Features);
    %% select the first feature using roulette wheel
        P=PV./sum(PV);
        newpop=myroulette(P,Num_Features,1);
        a(newpop)=1;
        newpop=myroulette(P,Num_Features,1);
        b(newpop)=1;
    
    %% select the next features 
    for ii=2:m_a
        % for generatin individual a
        my_ones_a=find(a);
        my_zeros_a=find(a==0);
        sum1=0;
        for z=1:Num_Features
            for k=1:length( my_zeros_a)
                d=prod(PM( my_zeros_a(k),my_ones_a))*PV( my_zeros_a(k));
                sum1=sum1+d;
            end
            P(z)=(prod(PM(z,my_ones_a))*PV(z))/(sum1);
        end
       P(my_ones_a)=0;%dadan ehtemal 0 be feature hayi ke gablan entekhab shodan
       newpop=myroulette(P,Num_Features,1);
       a(newpop)=1;
    end
   
       %for generatin individula b
        for jj=2:m_b
        my_ones_b=find(b);
        my_zeros_b=find(b==0);
        sum1=0;
        for z=1:Num_Features
            for k=1:length(my_zeros_b)
                d=prod(PM(my_zeros_b(k),my_ones_b))*PV(my_zeros_b(k));
                sum1=sum1+d;
            end
            P(z)=(prod(PM(z,my_ones_b))*PV(z))/(sum1);
        end
       P(my_ones_b)=0;%dadan ehtemal 0 be feature hayi ke gablan entekhab shodan
       newpop=myroulette(P,Num_Features,1);
       b(newpop)=1;

        end  
percent_fs=[];
percent_fs(1)=sum(a)/Num_Features;
percent_fs(2)=sum(b)/Num_Features;
%  ---------- compute fitness ----------
Acc_rate=[];
calmat=[];
f=zeros(2,Num_Features);
f(1,:)=a(1,:);
f(2,:)=b(1,:);
for i=1:2
    data=[];
    for j=1:Num_samples 
        d=[];
        for k=1:Num_Features
            if (f(i,k)==1)            
                  d=[d main_data(j,k)];
            end
        end
       data=[data;d];     
    end
    
    data=[data main_data(:,end)];
    traindata=data(indTr,1:end-1);
    gtrain=data(indTr,end);
    testdata=data(indTe,1:end-1);
    gtest=data(indTe,end);

    
    %% Two-class
%     Mdl=fitcsvm(trainX,trainY);
%     label = predict(Mdl,testX);
% %     Agent_no=i
%     Acc=(sum(label==testY))/length(label);
% %     Acc_rate=[Acc_rate;Acc];
            
%% Multi-class
    ComputeSVM = fitcecoc(traindata',gtrain','ObservationsIn','columns','Coding','onevsall'); 
    
%% mos k-fold
%     cvmodel = crossval(ComputeSVM);
%     L = kfoldLoss(cvmodel)
    %%
    inFitValSVM = resubLoss(ComputeSVM);
    [cvSVM] = predict(ComputeSVM,testdata);
    Acc = (sum(cvSVM == gtest))/length(cvSVM);
    Acc_rate=[Acc_rate;Acc];
    [Recall,Precision,F_score]=cal(cvSVM,gtest);
    calvector=[Recall Precision F_score];
    calmat=[calmat;calvector];
end
 fitness=Acc_rate ./ (1*percent_fs);
% fitness=Acc_rate;
fitness_final=[];
%-----considering acc & num features as fitness--------
fitness_final(1)=fitness(1,1);
fitness_final(2)=fitness(2,2);
%-----considering acc as fitness--------
% fitness_final(1)=fitness(1,1);
% fitness_final(2)=fitness(2,1);
if (fitness_final(1)>fitness_final(2))
    winner=a;
    loser=b;
    if (Acc_rate(1)>Best_Acc)
        Best_Acc=Acc_rate(1);
        Best_winner=winner;
        Best_iteration=l;
        Best_Recall=calmat(1,1);
        Best_Precision=calmat(1,2);
        Best_F_score=calmat(1,3);

    end
else
    winner=b;
    loser=a;
    if (Acc_rate(2)>Best_Acc)
        Best_Acc=Acc_rate(2);
        Best_winner=winner;
        Best_iteration=l;
        Best_Recall=calmat(2,1);
        Best_Precision=calmat(2,2);
        Best_F_score=calmat(2,3);
    end
end

DD=[DD;sum(winner)];    
%  ---------- update PV & PM ----------
for i=1:Num_Features
    for j=i+1:Num_Features
        if winner(1,i)==0 && winner(1,j)==0 && loser(1,i)==0 && loser(1,j)==1
            PV(1,j)=PV(1,j)-Np;
            matrix(1,2)=matrix(1,2)+1;

        else if winner(1,i)==0 && winner(1,j)==0 && loser(1,i)==1 && loser(1,j)==0
                PV(1,i)=PV(1,i)-Np;
                matrix(1,3)=matrix(1,3)+1;

             else if  winner(1,i)==0 && winner(1,j)==0 && loser(1,i)==1 && loser(1,j)==1
                    PM(i,j)=PM(i,j)-Np;
                    PM(j,i)=PM(i,j);
                    counter(i,j)= counter(i,j)+1;
                    PV(1,i)=PV(1,i)-Np;
                    PV(1,j)=PV(1,j)-Np;
                    matrix(1,4)=matrix(1,4)+1;
                else if winner(1,i)==0 && winner(1,j)==1 && loser(1,i)==0 && loser(1,j)==0
                        PV(1,j)=PV(1,j)+Np;
                        matrix(2,1)=matrix(2,1)+1;
                     else if winner(1,i)==0 && winner(1,j)==1 && loser(1,i)==1 && loser(1,j)==0
                                PV(1,i)=PV(1,i)-Np;
                                PV(1,j)=PV(1,j)+Np;
                                matrix(2,3)=matrix(2,3)+1;
                            else if winner(1,i)==0 && winner(1,j)==1 && loser(1,i)==1 && loser(1,j)==1
                                    PM(i,j)=PM(i,j)-(2*Np);
                                    PM(j,i)=PM(i,j);
                                     counter(i,j)= counter(i,j)+1;
                                    PV(1,i)=PV(1,i)-Np;
                                    matrix(2,4)=matrix(2,4)+1;
                                else if winner(1,i)==1 && winner(1,j)==0 && loser(1,i)==0 && loser(1,j)==0
                                       PV(1,i)=PV(1,i)+Np; 
                                       matrix(3,1)=matrix(3,1)+1;
                                    else if winner(1,i)==1 && winner(1,j)==0 && loser(1,i)==0 && loser(1,j)==1
                                            PV(1,i)=PV(1,i)+Np;
                                            PV(1,j)=PV(1,j)-Np;
                                            matrix(3,2)=matrix(3,2)+1;
                                        else if winner(1,i)==1 && winner(1,j)==0 && loser(1,i)==1 && loser(1,j)==1
                                                PM(i,j)=PM(i,j)-(2*Np);
                                                PM(j,i)=PM(i,j);
                                                 counter(i,j)= counter(i,j)+1;
                                                PV(1,j)=PV(1,j)-Np;
                                                matrix(3,4)=matrix(3,4)+1;
                                            else if winner(1,i)==1 && winner(1,j)==1 && loser(1,i)==0 && loser(1,j)==0
                                                    PM(i,j)=PM(i,j)+Np;
                                                    PM(j,i)=PM(i,j);
                                                     counter(i,j)= counter(i,j)+1;
                                                    PV(1,i)=PV(1,i)+Np;
                                                    PV(1,j)=PV(1,j)+Np;
                                                    matrix(4,1)=matrix(4,1)+1;
                                                else if winner(1,i)==1 && winner(1,j)==1 && loser(1,i)==0 && loser(1,j)==1
                                                        PM(i,j)=PM(i,j)+(2*Np);
                                                        PM(j,i)=PM(i,j);
                                                         counter(i,j)= counter(i,j)+1;
                                                        PV(1,i)=PV(1,i)+Np;
                                                        matrix(4,2)=matrix(4,2)+1;
                                                    else if winner(1,i)==1 && winner(1,j)==1 && loser(1,i)==1 && loser(1,j)==0
                                                        PM(i,j)=PM(i,j)+(2*Np);
                                                        PM(j,i)=PM(i,j);
                                                         counter(i,j)= counter(i,j)+1;
                                                        PV(1,j)=PV(1,j)+Np;
                                                        matrix(4,3)=matrix(4,3)+1;
                                                    
                                                                                 
                                    
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                         end
                    end
                 end
            end
        end
    end
end

for i=1:Num_Features
    for j=1:Num_Features
             if PM(i,j)<0;
                PM(i,j)=0.0001;
             end
    end
end
for i=1:Num_Features
    
            if PV(1,i)<0;
                PV(1,i)=0.0001;
            end
end

m=sum(winner);
m_a=round(random('chisquare',m))+1
m_b=round(random('chisquare',m))+1
end
Best_Acc=Best_Acc*100;
% winner
end