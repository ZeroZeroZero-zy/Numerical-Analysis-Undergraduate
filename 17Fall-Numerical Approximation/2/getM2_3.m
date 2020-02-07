function [M]=getM2_3(A,d)
n=size(A,1);
x=zeros(n,1);
a=zeros(n,1);
c=zeros(n,1);
a(1)=A(1,n);
a(2:n)=diag(A,-1);
b=diag(A);
c(1:n-1)=diag(A,1);
c(n)=A(n,1);
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
s=zeros(n+1,1);
t=zeros(n,1);
v=zeros(n,1);
s(1)=1;
t(n)=1;
v(n)=0;
for k=1:n
    s(k+1)=-a(k)*s(k)/p(k);
end
for k=n-1:-1:1
    t(k)=q(k+1)*t(k+1)+s(k+1);
    v(k)=q(k+1)*v(k+1)+u(k+1);
end
x(n)=(d(n)-a(n)*v(n-1)-c(n)*v(1))/(c(n)*t(1)+a(n)*t(n-1)+b(n));
for k=1:n-1
    x(k)=t(k)*x(n)+v(k);
end
M=zeros(n+1,1);
M(1)=x(n);
M(2:n+1)=x;
end