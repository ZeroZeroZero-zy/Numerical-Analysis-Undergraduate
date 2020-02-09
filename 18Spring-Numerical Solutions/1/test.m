clc
clear

f=@(x,y)y-2*x/y;
g=@(x)sqrt(1+2*x);
a=0;
b=1;
h=0.1;
y0=1;

y=EulerForward(f,y0,a,b,h);
n=(b-a)/h+1;
x=a*ones(n,1);
for i=1:n
    x(i)=x(i)+(i-1)*h;
end

y1=g(x);
y2=EulerImprove(f,y0,a,b,h);

disp([y y1 y2])