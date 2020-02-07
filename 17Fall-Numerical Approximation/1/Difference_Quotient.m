function [D]=Difference_Quotient(x,y)
n=length(x);
D=zeros(n);
D(:,1)=y;
for i= 2:n
    for j=i:n
        D(j,i)=(D(j-1,i-1)-D(j,i-1))/(x(j-i+1)-x(j));
    end
end
end