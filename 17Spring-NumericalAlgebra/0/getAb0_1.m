function [A,b]=getAb0_1(n)
a1=ones(n-1,1);
A1=diag(a1,-1);
a2=-4*ones(n,1);
A2=diag(a2);
a3=ones(n-1,1);
A3=diag(a3,1);
A=A1+A2+A3;

b=zeros(n,1);
b(1)=-27;
for i=2:n
    b(i)=-15;
end
end