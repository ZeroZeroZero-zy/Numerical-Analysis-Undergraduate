function [u]=LinearElement_Ritz(f,p,q,alpha,beta,x)
%x为[a,b]上的点组，不需要输入a,b
syms t
n=length(x)-1;
K=zeros(n,n);
b=zeros(n,1);
for i=2:n-1
    hi=x(i+1)-x(i);
    hi1=x(i+2)-x(i+1);
    
    int1 = -hi^-1*p(x(i)+hi*t) + hi*q(x(i)+hi*t)*t*(1-t);
    K(i,i-1)=quadgk(matlabFunction(int1),0,1,'RelTol',1e-8,'AbsTol',1e-12);
    
    int2 = hi^-1*p(x(i)+hi*t) + hi*q(x(i)+hi*t)*t^2 + hi1^-1*p(x(i+1)+hi1*t) + hi1*q(x(i+1)+hi1*t)*(1-t)^2;
    K(i,i)=quadgk(matlabFunction(int2),0,1,'RelTol',1e-8,'AbsTol',1e-12);
    
    int3 = -hi1^-1*p(x(i+1)+hi1*t) + hi1*q(x(i+1)+hi1*t)*t*(1-t);
    K(i,i+1)=quadgk(matlabFunction(int3),0,1,'RelTol',1e-8,'AbsTol',1e-12);
end

i=1;
hi=x(i+1)-x(i);
hi1=x(i+2)-x(i+1);
int2 = hi^-1*p(x(i)+hi*t) + hi*q(x(i)+hi*t)*t^2 + hi1^-1*p(x(i+1)+hi1*t) + hi1*q(x(i+1)+hi1*t)*(1-t)^2;
K(i,i)=quadgk(matlabFunction(int2),0,1,'RelTol',1e-8,'AbsTol',1e-12);
int3 = -hi1^-1*p(x(i+1)+hi1*t) + hi1*q(x(i+1)+hi1*t)*t*(1-t);
K(i,i+1)=quadgk(matlabFunction(int3),0,1,'RelTol',1e-8,'AbsTol',1e-12);

i=n;
hi=x(i+1)-x(i);
int1 = -hi^-1*p(x(i)+hi*t) + hi*q(x(i)+hi*t)*t*(1-t);
K(i,i-1)=quadgk(matlabFunction(int1),0,1,'RelTol',1e-8,'AbsTol',1e-12);
int2 = hi^-1*p(x(i)+hi*t) + hi*q(x(i)+hi*t)*t^2;
K(i,i)=quadgk(matlabFunction(int2),0,1,'RelTol',1e-8,'AbsTol',1e-12);

for i=1:n-1
    hi=x(i+1)-x(i);
    hi1=x(i+2)-x(i+1);
    
    intb = hi*f(x(i)+hi*t)*t + hi1*f(x(i+1)+hi1*t)*(1-t);
    b(i)=quadgk(matlabFunction(intb),0,1,'RelTol',1e-8,'AbsTol',1e-12);
end

intb = (x(n+1)-x(n))*f(x(n)+(x(n+1)-x(n))*t)*t;
b(n)=quadgk(matlabFunction(intb),0,1,'RelTol',1e-8,'AbsTol',1e-12);

i=1;
hi=x(i+1)-x(i);
int1 = -hi^-1*p(x(i)+hi*t) + hi*q(x(i)+hi*t)*t*(1-t);
a10=quadgk(matlabFunction(int1),0,1,'RelTol',1e-8,'AbsTol',1e-12);

b(1)=b(1)-alpha*a10;
b(n)=b(n)+beta*p(b);

u=K\b;
u=[alpha;u];
end

