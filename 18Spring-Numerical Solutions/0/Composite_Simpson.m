function [I]=Composite_Simpson(f,a,b,n)
h=(b-a)/n;
x=zeros(n+1,1);
for i=1:n+1
    x(i)=a+(i-1)*h;
end
fx=f(x);
I=0;
for i=1:n+1
    I=I+fx(i)*(2+(1+(-1)^i));
end
I=h*(I-fx(1)-fx(n+1))/3;
end