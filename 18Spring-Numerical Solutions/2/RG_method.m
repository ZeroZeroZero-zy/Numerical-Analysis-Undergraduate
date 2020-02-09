function [u]=RG_method(f,phi,p,q,a,b)
syms x;
n=length(phi);
A=zeros(n);
d=zeros(n,1);
for i=1:n
    for j=1:n
        h=p*diff(phi(i))*diff(phi(j))+q*phi(i)*phi(j);
        h=matlabFunction(h);
        A(i,j)=quadgk(h,a,b,'RelTol',1e-8,'AbsTol',1e-12);
    end
    h1=matlabFunction(f*phi(i));
    d(i)=quadgk(h1,a,b,'RelTol',1e-8,'AbsTol',1e-12);
end
c=A\d;
u=c'*phi;
end