function [A,d]=getAd2_1(x,y)
n=length(x);
h=zeros(1,n-1);
for i=1:n-1
    h(i)=x(i+1)-x(i);
end
lambda=zeros(1,n-1);
mu=zeros(1,n-1);
lambda(1)=0;
mu(n-1)=0;
for i=1:n-2
    lambda(i+1)=h(i+1)/(h(i)+h(i+1));
    mu(i)=1-lambda(i+1);
end
A0=diag(2*ones(1,n));
A1=diag(mu,-1);
A2=diag(lambda,1);
A=A0+A1+A2;
d=zeros(n,1);
for i=1:n-2
    d(i+1)=6*((y(i+2)-y(i+1))/h(i+1)-(y(i+1)-y(i))/h(i))/(h(i)+h(i+1));
end
d(1)=0;
d(n)=0;
end