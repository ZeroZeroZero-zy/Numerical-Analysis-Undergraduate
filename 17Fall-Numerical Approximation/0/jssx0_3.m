clc
clear

a=5.613;
f=@(s)s^3-a;
x0=2;
eps=1e-6;
N=1e2;
[x,k]=fai(f,x0,eps,N);
[x1,k1]=Newton_method(f,5,6,eps,N);

disp('ʹ��Newton���õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x1,k1)
disp('ʹ�õ�����ʽ�õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x,k)