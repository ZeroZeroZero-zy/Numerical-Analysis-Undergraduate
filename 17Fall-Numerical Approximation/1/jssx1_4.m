clc
clear

%求解
n=20;
f=@(x)1./(1+x.^2);
g=@(x)-2*x./(1+x.^2).^2;
a=-5;
b=5;
[x,y,y_1]=getxyy1_4(n,a,b,f,g);
x0=3.7613;
p=getp1_4(x,y,x0);
H=getH1_4(x,y,y_1,x0);
x1=-5:0.01:5;
y1=getp1_4(x,y,x1);
y2=getH1_4(x,y,y_1,x1);

%结果
disp('使用学号构造的点为x=3.7613')
disp('该点处函数值为：')
fprintf('f(x)=%.6f\n',f(x0))
disp('使用分段线性插值得到的结果为：')
fprintf('p(x)=%.6f\n',p)
disp('使用分段三次Hermite插值得到的结果为：')
fprintf('H(x)=%.6f\n',H)

%画图
figure('Name','6_4')
plot(x1,f(x1),'-k')
hold on
plot(x,y,'ob')
hold on
plot(x1,y1,'-r')
hold on
plot(x1,y2,'-g')
legend('f(x)','插值结点','分段线性插值多项式','分段三次Hermite插值')
title('f(x)=1/(1+x^2)图像与分段线性插值多项式、分段三次Hermite插值多项式图像对比')
