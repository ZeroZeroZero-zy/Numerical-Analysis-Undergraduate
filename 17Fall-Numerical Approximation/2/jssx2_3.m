clc
clear

%求解
f=@(x)3*sin(x)+2*cos(x);
x=linspace(-pi,pi,11);
y=f(x);
[A,d]=getAd2_3(x,y);
M=getM2_3(A,d);
x1=-pi:0.01:pi;
y1=getS2_1(x,y,M,x1);

%画图
figure('Name','7_3')
plot(x1,f(x1),'-k')
hold on
plot(x,y,'o',x1,y1,'-r')
legend('f(x)','插值结点','三次样条插值函数图形')
title('f(x)=3sin(x)+2cos(x)图像与三次样条插值函数图形对比')