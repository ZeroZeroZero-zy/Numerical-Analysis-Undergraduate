clc
clear

f=@(x)exp(x)-2;
a=0;
b=2;
eps=1e-6;
N=1e5;

[x0,k0]=Bisection_method(f,a,b,eps,N);
[x1,k1]=Newton_method(f,a,b,eps,N);
[x2,k2]=Newton_Simple_method(f,a,b,eps,N);
[x3,k3]=Secant_method(f,a,b,N);

disp('使用二分法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x0,k0)

disp('使用牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x1,k1)

disp('使用简化牛顿法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x2,k2)

disp('使用弦法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x3,3)