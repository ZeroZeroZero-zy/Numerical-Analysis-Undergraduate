function [u]=CenteredDifference(f,q,a,b,n,alpha,beta)
h=(b-a)/n;
x=a:h:b;
u=zeros(n+1,1);
u(1)=alpha;
u(n+1)=beta;

A=zeros(n-1);
d=zeros(n-1,1);
for i=2:n-2
    A(i,i-1)=1/h^2;
    A(i,i)=q(x(i+1))-2/h^2;
    A(i,i+1)=1/h^2;
end

i=1;
A(i,i)=q(x(i+1))-2/h^2;
A(i,i+1)=1/h^2;

i=n-1;
A(i,i-1)=1/h^2;
A(i,i)=q(x(i+1))-2/h^2;

for i=1:n-1
    d(i)=f(x(i+1));
end
d(1)=d(1)-u(1)/h^2;
d(n-1)=d(n-1)-u(n+1)/h^2;

u1=A\d;
u(2:n)=u1;
end