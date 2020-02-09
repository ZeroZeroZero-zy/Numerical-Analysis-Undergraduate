function [u]=ConservationDifference(f,p,q,a,b,n,alpha,beta)
h=(b-a)/n;
x=a:h:b;
u=zeros(n+1,1);
u(1)=alpha;

A=zeros(n-1);
d=zeros(n-1,1);
for i=2:n-2
    A(i,i-1)=-p((x(i)+x(i+1))/2)/h;
    A(i,i)=p((x(i)+x(i+1))/2)/h+p((x(i+1)+x(i+2))/2)/h+h*q(x(i+1));
    A(i,i+1)=-p((x(i+1)+x(i+2))/2)/h;
    d(i)=h*f(x(i+1));
end

i=1;
A(i,i)=p((x(i)+x(i+1))/2)/h+p((x(i+1)+x(i+2))/2)/h+h*q(x(i+1));
A(i,i+1)=-p((x(i+1)+x(i+2))/2)/h;
d(i)=h*f(x(i+1))+u(1)*p((x(i)+x(i+1))/2)/h;

i=n-1;
A(i,i-1)=-p((x(i)+x(i+1))/2)/h;
aN=p((x(i+1)+x(i+2))/2);
dN=q(x(n+1));
A(i,i)=p((x(i)+x(i+1))/2)/h+p((x(i+1)+x(i+2))/2)/h+h*q(x(i+1))-2*aN^2/(h*(aN+h^2*dN));
phiN=f(x(n+1));
d(i)=h*f(x(i+1))+aN*(-2*beta+h*phiN)/(2*aN+h^2*dN);

u1=A\d;
u(2:n)=u1;
u(n+1)=(2*aN*u(n)-2*h*beta+h^2*phiN)/(2*aN+h^2*dN);
end