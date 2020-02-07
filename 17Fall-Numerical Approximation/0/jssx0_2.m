clc
clear

syms x
y1=@(x)x-0.3*cos(x)-1;
y2=@(x)cos(x)-1/2-sin(x);
y3=@(x)exp(-x)-sin(x);

figure('Name','5_2_1')
ezplot(y1(x),[-5,5])
refline(0,0)
grid on
title('x-0.3*cos(x)-1图像')

figure('Name','5_2_2')
ezplot(y2(x),[-5,5])
refline(0,0)
grid on
title('cos(x)-1/2-sin(x)图像')

figure('Name','5_2_3')
ezplot(y3(x),[-5,5])
refline(0,0)
grid on
title('exp(-x)-sin(x)图像')
%从图中看出y1的零点在(0,2)内，y2的最小正零点在(0,1)内，y3的最小正零点在(0,1)内

%y1=0
disp('1.方程x=1+0.3*cos(x)的根：')
%二分法
[x1_b,k1_b]=Bisection_method(y1,0,2,1e-6,1e6);
disp('使用二分法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x1_b,k1_b)
%牛顿法
[x1_n,k1_n]=Newton_method(y1,0,2,1e-6,1e6);
disp('使用牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x1_n,k1_n)
%简化牛顿法
[x1_ns,k1_ns]=Newton_method(y1,0,2,1e-6,1e6);
disp('使用简化牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x1_ns,k1_ns)
%弦法
[x1_s,k1_s]=Secant_method(y1,0,2,1e6);
disp('使用弦法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x1_s,k1_s)
%验证
x1_0=fzero(y1,[0 2]);
disp('使用fzero验证得到的结果为：')
fprintf('x=%.6f\n',x1_0)

%y2=0
disp(' ')
disp('2.方程cos(x)=1/2+sin(x)的最小正根：')
%二分法
[x2_b,k2_b]=Bisection_method(y2,0,1,1e-6,1e6);
disp('使用二分法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x2_b,k2_b)
%牛顿法
[x2_n,k2_n]=Newton_method(y2,0,1,1e-6,1e6);
disp('使用牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x2_n,k2_n)
%简化牛顿法
[x2_ns,k2_ns]=Newton_method(y2,0,2,1e-6,1e6);
disp('使用简化牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x2_ns,k2_ns)
%弦法
[x2_s,k2_s]=Secant_method(y2,0,2,1e6);
disp('使用弦法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x2_s,k2_s)
%验证
x2_0=fzero(y2,[0 2]);
disp('使用fzero验证得到的结果为：')
fprintf('x=%.6f\n',x2_0)

%y3=0
disp(' ')
disp('3.方程e^-x=sin(x)的最小正根：')
%二分法
[x3_b,k3_b]=Bisection_method(y3,0,1,1e-6,1e6);
disp('使用二分法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x3_b,k3_b)
%牛顿法
[x3_n,k3_n]=Newton_method(y3,0,1,1e-6,1e6);
disp('使用牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x3_n,k3_n)
%简化牛顿法
[x3_ns,k3_ns]=Newton_method(y3,0,2,1e-6,1e6);
disp('使用简化牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x3_ns,k3_ns)
%弦法
[x3_s,k3_s]=Secant_method(y3,0,1,1e6);
disp('使用弦法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x3_s,k3_s)
%验证
x3_0=fzero(y3,[0 1]);
disp('使用fzero验证得到的结果为：')
fprintf('x=%.6f\n',x3_0)