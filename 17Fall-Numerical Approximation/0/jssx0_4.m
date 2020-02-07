clc
clear

syms x
f=x^5-9*x^4+26*x^3-34*x^2+21*x-5;
eps=1e-6;
N=1e2;
x0=6.3;
%求解
[x,k]=Polynomial_Newton(f,x0,eps,N);
disp('使用秦九韶算法Newton法得到的结果为：')
fprintf('x=%.6f,迭代步数%d\n\n',x,k)
%验证
p=sym2poly(f);
r=roots(p);
disp('使用roots验证得到的结果为：')
disp(r)