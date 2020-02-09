function [y]=EulerImprove(f,y0,a,b,h)
N=(b-a)/h;
x=a:h:b;
y=zeros(N+1,1);
y(1)=y0;
for n=0:N-1
    y(n+2)=y(n+1)+h*(f(x(n+1),y(n+1))+f(x(n+2),y(n+1)+h*f(x(n+1),y(n+1))))/2;
end
end