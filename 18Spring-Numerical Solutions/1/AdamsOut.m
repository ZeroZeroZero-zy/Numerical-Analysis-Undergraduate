function [y]=AdamsOut(f,y,a,b,h)
n=(b-a)/h+1;
x=a:h:b;
for i=1:n-4
    y(i+4)=y(i+3)+(h/24)*(55*f(x(i+3),y(i+3))-59*f(x(i+2),y(i+2))...
        +37*f(x(i+1),y(i+1))-9*f(x(i),y(i)));
end
end