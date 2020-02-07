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

disp('ʹ�ö��ַ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x0,k0)

disp('ʹ��ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x1,k1)

disp('ʹ�ü�ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x2,k2)

disp('ʹ���ҷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x3,3)