function [newpop]=myroulette(P,n,popsize)
popsize=1;%

% prob1=P(:,n+2) / totalfit;
prob=cumsum(P);
rns=rand(popsize,1)*prob(end);
fitin=1; newin=1;
while newin<=popsize
if (rns(newin)<= prob(fitin))
newpop(newin)=fitin;
newin=newin+1;
else
fitin=fitin+1;
end
end
end