clc
clear
close all

f=@(t,y)3*t/cos(3*t)+sin(3*t)-3*tan(3*t)*y;
g=@(t,y)6*cos(3*t)-9*y;
a=0;
b=1;
h=0.05;
y0=0;
y0_=0;

y=EulerForward(f,y0,a,b,h);
y1=EulerForward(g,y0,a,b,h);

yt=@(t)t.*sin(3*t);
yt1=@(t)sin(3*t)+3*t.*cos(3*t);

t=0:h:1;
yt0=yt(t);
yt10=yt1(t);


figure('Name','y数值解')
plot(t,y,'-r',t,yt0,'-k')
legend('数值解','精确解')
title('1')

figure('Name','y(1)数值解')
plot(t,y1,'-r',t,yt10,'-k')
legend('数值解','精确解')
title('2')