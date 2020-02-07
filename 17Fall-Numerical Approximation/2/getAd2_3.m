function [A,d]=getAd2_3(x,y)
n=length(x);
h=zeros(1,n-1);
for i=1:n-1
    h(i)=x(i+1)-x(i);
end
lambda=zeros(1,n-1);
mu=zeros(1,n-1);
lambda(n-1)=h(1)/(h(n-1)+h(1));
mu(n-1)=1-lambda(n-1);
for i=1:n-2
    lambda(i)=h(i+1)/(h(i)+h(i+1));
    mu(i)=1-lambda(i);
end
A0=diag(2*ones(1,n-1));
A1=diag(mu(2:n-1),-1);
A2=diag(lambda(1:n-2),1);
A=A0+A1+A2;
A(1,n-1)=mu(1);
A(n-1,1)=lambda(n-1);
d=zeros(n-1,1);
for i=1:n-2
    d(i)=6*((y(i+2)-y(i+1))/h(i+1)-(y(i+1)-y(i))/h(i))/(h(i)+h(i+1));
end
d(n-1)=6*((y(2)-y(n))/h(1)-(y(n)-y(n-1))/h(n-1))/(h(n-1)+h(1));
end