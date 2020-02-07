clc
clear

a=5.613;
f=@(s)s^3-a;
x0=2;
eps=1e-6;
N=1e2;
[x,k]=fai(f,x0,eps,N);
[x1,k1]=Newton_method(f,5,6,eps,N);

disp('使用Newton法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x1,k1)
disp('使用迭代格式得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x,k)