clc
clear

syms x
f=x^5-9*x^4+26*x^3-34*x^2+21*x-5;
eps=1e-6;
N=1e2;
x0=6.3;
%���
[x,k]=Polynomial_Newton(f,x0,eps,N);
disp('ʹ���ؾ����㷨Newton���õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x,k)
%��֤
p=sym2poly(f);
r=roots(p);
disp('ʹ��roots��֤�õ��Ľ��Ϊ��')
disp(r)