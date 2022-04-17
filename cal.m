function[Recall,Precision,F_score]=cal(LABEL,target_test)
%%% matrice de confusion
[confMat,order] = confusionmat(LABEL,target_test);
%%% calcul de la précision , le rappel (recall) et le F-score
%%% recall
for i =1:size(confMat,1)
recall(i)=confMat(i,i)/sum(confMat(i,:));
end
recall(isnan(recall))=[];

Recall=sum(recall)/size(confMat,1);
%%% précision
for i =1:size(confMat,1)
precision(i)=confMat(i,i)/sum(confMat(:,i));
end
 precision(isnan(precision))=[];
Precision=sum(precision)/size(confMat,1);
%%% F-score
F_score=2*Recall*Precision/(Precision+Recall); %%F_score=2*1/((1/Precision)+(1/Recall));
end