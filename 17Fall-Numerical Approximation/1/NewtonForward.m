function [f]=NewtonForward(x,y,x0)
n=length(x);
h=(x(n)-x(1))/(n-1);
t=(x0-x(1))/h;
f=y(1);
a=1;
for i=1:n-1
    s=1/factorial(i);
    a=a*(t-i+1);
    b=0;
    for j=0:i
        b=b+nchoosek(i,j)*(-1)^j*y(i-j+1);
    end
    f=f+s*a*b;
end
end 