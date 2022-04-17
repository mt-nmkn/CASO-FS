% cmetric(A,B)

% load pareto1.mat
% load pareto2.mat
A=[1,0.318181818181818;2,0.0681818181818182;3,0.0454545454545454;4,0.0227272727272727;7,0];
B=[1,0.318181818181818;2,0.0681818181818182;3,0.0454545454545454;4,0.0227272727272727;7,0];
s=0;
[m1,n1]=size(A);
[m2,n2]=size(B);
for i=1:m2  %B
    for j=1:m1 %A
        if (A(j,1)==B(i,1)&&(A(j,2)<B(i,2)))
            s=s+1;
            break;
        elseif (A(j,1)<B(i,1)&&(A(j,2)==B(i,2)))
            s=s+1;
            break;
        elseif(A(j,1)<B(i,1)&&(A(j,2)<B(i,2)))
            s=s+1;
            break;
        end
    end
end
cm=s/m2
