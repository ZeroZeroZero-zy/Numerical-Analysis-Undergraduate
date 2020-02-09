function [y]=RK_method(f,y0,a,b,h)
n=(b-a)/h+1;
x=a:h:b;
y=zeros(n,1);
y(1)=y0;
for i=1:n-1
    k1=f(x(i),y(i));
    k2=f(x(i)+h/2,y(i)+h*k1/2);
    k3=f(x(i)+h/2,y(i)+h*k2/2);
    k4=f(x(i)+h,y(i)+h*k3);
    y(i+1)=y(i)+h*(k1+2*k2+2*k3+k4)/6;
end
end