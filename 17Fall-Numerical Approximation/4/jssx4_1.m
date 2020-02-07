clc
clear

f=@(x)3*cos(x)+2*sin(x);
x=linspace(0,pi,26);
y=f(x);
n=3;
X=getX9_1(x,y,n);
X0=polyfit(x,y,n);
X1=fliplr(X0);

disp('使用最小二乘原理拟合得到的三次多项式系数为：')
fprintf('%.5d  %.5d  %.5d  %.5d\n',X(1),X(2),X(3),X(4))
disp('使用polyfit验证得到的三次多项式系数为：')
fprintf('%.5d  %.5d  %.5d  %.5d\n',X1(1),X1(2),X1(3),X1(4))
