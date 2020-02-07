function [x]=Cramer0_1(A,b)
n=size(A,1);
x=zeros(n,1);
d=det(A);
for i=1:n
    H=A;
    H(:,i)=b;
    x(i)=det(H)/d;
end
end