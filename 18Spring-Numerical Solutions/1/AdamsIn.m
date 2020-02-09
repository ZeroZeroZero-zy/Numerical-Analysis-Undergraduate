function [y]=AdamsIn(f,y,a,b,h)
n=(b-a)/h+1;
x=a:h:b;
for i=1:n-4
    y1=y(i+3)+(h/24)*(9*f(x(i+3),y(i+2))+19*f(x(i+2),y(i+2))...
        -5*f(x(i+1),y(i+1))+f(x(i),y(i)));
    y2=y(i+3)+(h/24)*(9*f(x(i+3),y1)+19*f(x(i+2),y(i+2))...
        -5*f(x(i+1),y(i+1))+f(x(i),y(i)));
    while(norm(y1-y2)>1e-6)
        y1=y2;
        y2=y(i+3)+(h/24)*(9*f(x(i+3),y1)+19*f(x(i+2),y(i+2))...
           -5*f(x(i+1),y(i+1))+f(x(i),y(i)));
    end
    y(i+4)=y2;
end
end