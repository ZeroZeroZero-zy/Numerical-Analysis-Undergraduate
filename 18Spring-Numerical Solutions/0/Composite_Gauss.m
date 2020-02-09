function [I]=Composite_Gauss(f,a,b,m)
n=2*m;
h=(b-a)/n;
x=zeros(n+1,1);
for i=1:n+1
    x(i)=a+(i-1)*h;
end
I=0;
for i=1:m
    I=I+(2*h)*(5*f(x(2*i-1)+h*(1-sqrt(3/5))/2)+8*f(x(2*i-1)+h/2)+5*f(x(2*i-1)+h*(1+sqrt(3/5))/2))/18;
end
end