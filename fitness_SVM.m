function f=fitness_SVM(train_data,gtrain,test_data,gtest)
Mdl=fitcsvm(train_data,gtrain);
label = predict(Mdl,test_data);
f=(sum(label~=gtest))/length(label);
end