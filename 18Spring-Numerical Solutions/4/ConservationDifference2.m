function [u]=ConservationDifference2(f,p,q,a,b,n,alpha,beta)
h=(b-a)/n;
x=a:h:b;
u=zeros(n+1,1);
u(1)=alpha;

A=zeros(n);
d=zeros(n,1);
for i=2:n-1
    A(i,i-1)=-(2*p(x(i)*p(x(i+1)))/(p(x(i))+p(x(i+1))))/h;
    A(i,i)=(2*p(x(i)*p(x(i+1)))/(p(x(i))+p(x(i+1))))/h + (2*p(x(i+1)*p(x(i+2)))/(p(x(i+1))+p(x(i+2))))/h + h*(q((x(i)+x(i+1))/2)+q((x(i+1)+x(i+2))/2))/2;
    A(i,i+1)=-(2*p(x(i+1)*p(x(i+2)))/(p(x(i+1))+p(x(i+2))))/h;
    d(i)=h*(f((x(i)+x(i+1))/2)+f((x(i+1)+x(i+2))/2))/2;
end

i=1;
A(i,i)=(2*p(x(i)*p(x(i+1)))/(p(x(i))+p(x(i+1))))/h + (2*p(x(i+1)*p(x(i+2)))/(p(x(i+1))+p(x(i+2))))/h + h*(q((x(i)+x(i+1))/2)+q((x(i+1)+x(i+2))/2))/2;
A(i,i+1)=-(2*p(x(i+1)*p(x(i+2)))/(p(x(i+1))+p(x(i+2))))/h;
d(i)=h*(f((x(i)+x(i+1))/2)+f((x(i+1)+x(i+2))/2))/2+u(1)*p((x(i)+x(i+1))/2)/h;

i=n;
A(i,i-1)=-(2*p(x(i)*p(x(i+1)))/(p(x(i))+p(x(i+1))))/h;
A(i,i)=(2*p(x(i)*p(x(i+1)))/(p(x(i))+p(x(i+1))))/h + h*(q((x(i)+x(i+1))/2)+q((x(i+1)+x(i+2))/2))/2;
d(i)=-beta+h*(f((x(i)+x(i+1))/2)+f((x(i+1)+x(i+2))/2))/4;

u1=A\d;
u(2:n+1)=u1;
end