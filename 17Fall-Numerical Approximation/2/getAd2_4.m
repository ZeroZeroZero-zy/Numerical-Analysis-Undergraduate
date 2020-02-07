function [A,d]=getAd2_4(x,y,y0_1,yN_1)
n=length(x);
h=zeros(1,n-1);
for i=1:n-1
    h(i)=x(i+1)-x(i);
end
lambda=zeros(1,n-1);
mu=zeros(1,n-1);
lambda(n-1)=0;
mu(1)=0;
for i=1:n-2
    lambda(i)=h(i+1)/(h(i)+h(i+1));
    mu(i+1)=1-lambda(i);
end
A0=diag(2*ones(1,n));
A1=diag(mu,1);
A2=diag(lambda,-1);
A=A0+A1+A2;
d=zeros(n,1);
for i=1:n-2
    d(i+1)=3*(mu(i+1)*(y(i+2)-y(i+1))/h(i+1)+lambda(i)*(y(i+1)-y(i))/h(i));
end
d(1)=2*y0_1;
d(n)=2*yN_1;
end