function [M]=getM2_1(A,d)
n=size(A,1);
x=zeros(n,1);
a=zeros(n,1);
c=zeros(n,1);
a(2:n)=diag(A,-1);
b=diag(A);
c(1:n-1)=diag(A,1);
p=zeros(n,1);
q=zeros(n+1,1);
u=zeros(n+1,1);
q(1)=0;
u(1)=0;
for k=1:n
    p(k)=a(k)*q(k)+b(k);
    q(k+1)=-c(k)/p(k);
    u(k+1)=(d(k)-a(k)*u(k))/p(k);
end
x(n)=(d(n)-a(n)*u(n))/(b(n)+a(n)*q(n));
for k=n-1:-1:1
    x(k)=q(k+1)*x(k+1)+u(k+1);
end
M=x;
end