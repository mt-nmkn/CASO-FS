function sp=spacing(pareto)
[m,n]=size(pareto);
for i=1:m
    if (i==1)
        d(i)=abs(pareto(i,1)-pareto(i+1,1))+abs(pareto(i,2)-pareto(i+1,2));
    elseif(i==m)
        d(i)=abs(pareto(i,1)-pareto(i-1,1))+abs(pareto(i,2)-pareto(i-1,2));
    else
        x=abs(pareto(i,1)-pareto(i+1,1))+abs(pareto(i,2)-pareto(i+1,2));
        y=abs(pareto(i,1)-pareto(i-1,1))+abs(pareto(i,2)-pareto(i-1,2));
        d(i)=min(x,y);
    end
end
avg=mean(d);
s=0;

for i=1:m
    s=s+((avg-d(i))^2);
end
sp=s/(m-1);
sp=sqrt(sp);
end