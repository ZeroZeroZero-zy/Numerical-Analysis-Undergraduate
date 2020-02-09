clc
clear
close all

f=@(x,y)-8*y+8.125*cos(x);
g=@(x)0.125*x+cos(x);
a=0;
b=2;
h=0.1;
y0=1;

y=RK_method(f,y0,a,b,h);

x=(a:h:b)';

figure('Name','1-2')
plot(x,y,'-r',x,g(x),'-k')
legend('数值解','精确解')
title('显型四级RK法')