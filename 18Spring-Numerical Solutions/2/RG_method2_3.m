function [u]=RG_method2_3(f,phi)
%此题中区域G=(-1,1)x(-1,1)
syms x y;
n=length(phi);
A=zeros(n);
d=zeros(n,1);
for i=1:n
    for j=1:n
        h=diff(phi(i),x)*diff(phi(j),x)+diff(phi(i),y)*diff(phi(j),y);
        h=matlabFunction(h);
        A(i,j)=quad2d(h,-1,1,-1,1,'RelTol',1e-8,'AbsTol',1e-12);
    end
    h1=matlabFunction(f*phi(i));
    d(i)=quad2d(h1,-1,1,-1,1,'RelTol',1e-8,'AbsTol',1e-12);
end
c=A\d;
u=c'*phi;
end