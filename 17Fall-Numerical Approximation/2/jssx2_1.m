clc
clear

%求解
x=[1 2 3 4 5 6 7 8 9 10];
y=[244 221 208 208 211.5 216 219 221 221.5 220];
x0=7.613;
[A,d]=getAd2_1(x,y);
M=LUsolve2_3(A,d); %使用追赶法解方程组
M1=getM2_1(A,d);
disp('对比两种方法得到的M：')
disp('      M         M1')
disp([M M1])  %对比两种方法得到的M
S=getS2_1(x,y,M,x0);
S1=spline(x,y,x0);
x1=1:0.01:10;
y1=getS2_1(x,y,M,x1);
y2=spline(x,y,x1);

%结果
disp('使用学号构造的点为x_c=7.613')
disp('使用三次样条插值得到的结果为：')
fprintf('s(x_c)=%.6f\n',S)
disp('使用spline验证得到的结果为：')
fprintf('s(x_c)=%.6f\n',S1)

%画图
figure('Name','7_1')
plot(x,y,'o',x1,y1,'-r')
hold on
plot(x1,y2,':k')
legend('插值结点','三次样条插值函数图形','spline验证')
title('三次样条插值函数图形')