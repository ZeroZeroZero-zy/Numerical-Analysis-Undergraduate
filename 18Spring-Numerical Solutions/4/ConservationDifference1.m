function [u]=ConservationDifference1(f,p,q,a,b,n,alpha,beta)
h=(b-a)/n;
x=a:h:b;
u=zeros(n+1,1);
u(1)=alpha;

A=zeros(n);
d=zeros(n,1);
for i=2:n-1
    A(i,i-1)=-p((x(i)+x(i+1))/2)/h;
    A(i,i)=p((x(i)+x(i+1))/2)/h+p((x(i+1)+x(i+2))/2)/h+h*q(x(i+1));
    A(i,i+1)=-p((x(i+1)+x(i+2))/2)/h;
    d(i)=h*f(x(i+1));
end

i=1;
A(i,i)=p((x(i)+x(i+1))/2)/h+p((x(i+1)+x(i+2))/2)/h+h*q(x(i+1));
A(i,i+1)=-p((x(i+1)+x(i+2))/2)/h;
d(i)=h*f(x(i+1))+u(1)*p((x(i)+x(i+1))/2)/h;

i=n;
A(i,i-1)=-p((x(i)+x(i+1))/2)/h;
A(i,i)=p((x(i)+x(i+1))/2)/h+h*q(x(i+1))/2;
d(i)=-beta+h*f(x(i+1))/2;

u1=A\d;
u(2:n+1)=u1;
end