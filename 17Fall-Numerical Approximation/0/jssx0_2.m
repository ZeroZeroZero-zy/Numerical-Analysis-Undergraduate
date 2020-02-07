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
title('x-0.3*cos(x)-1ͼ��')

figure('Name','5_2_2')
ezplot(y2(x),[-5,5])
refline(0,0)
grid on
title('cos(x)-1/2-sin(x)ͼ��')

figure('Name','5_2_3')
ezplot(y3(x),[-5,5])
refline(0,0)
grid on
title('exp(-x)-sin(x)ͼ��')
%��ͼ�п���y1�������(0,2)�ڣ�y2����С�������(0,1)�ڣ�y3����С�������(0,1)��

%y1=0
disp('1.����x=1+0.3*cos(x)�ĸ���')
%���ַ�
[x1_b,k1_b]=Bisection_method(y1,0,2,1e-6,1e6);
disp('ʹ�ö��ַ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x1_b,k1_b)
%ţ�ٷ�
[x1_n,k1_n]=Newton_method(y1,0,2,1e-6,1e6);
disp('ʹ��ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x1_n,k1_n)
%��ţ�ٷ�
[x1_ns,k1_ns]=Newton_method(y1,0,2,1e-6,1e6);
disp('ʹ�ü�ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x1_ns,k1_ns)
%�ҷ�
[x1_s,k1_s]=Secant_method(y1,0,2,1e6);
disp('ʹ���ҷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x1_s,k1_s)
%��֤
x1_0=fzero(y1,[0 2]);
disp('ʹ��fzero��֤�õ��Ľ��Ϊ��')
fprintf('x=%.6f\n',x1_0)

%y2=0
disp(' ')
disp('2.����cos(x)=1/2+sin(x)����С������')
%���ַ�
[x2_b,k2_b]=Bisection_method(y2,0,1,1e-6,1e6);
disp('ʹ�ö��ַ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x2_b,k2_b)
%ţ�ٷ�
[x2_n,k2_n]=Newton_method(y2,0,1,1e-6,1e6);
disp('ʹ��ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x2_n,k2_n)
%��ţ�ٷ�
[x2_ns,k2_ns]=Newton_method(y2,0,2,1e-6,1e6);
disp('ʹ�ü�ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x2_ns,k2_ns)
%�ҷ�
[x2_s,k2_s]=Secant_method(y2,0,2,1e6);
disp('ʹ���ҷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x2_s,k2_s)
%��֤
x2_0=fzero(y2,[0 2]);
disp('ʹ��fzero��֤�õ��Ľ��Ϊ��')
fprintf('x=%.6f\n',x2_0)

%y3=0
disp(' ')
disp('3.����e^-x=sin(x)����С������')
%���ַ�
[x3_b,k3_b]=Bisection_method(y3,0,1,1e-6,1e6);
disp('ʹ�ö��ַ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x3_b,k3_b)
%ţ�ٷ�
[x3_n,k3_n]=Newton_method(y3,0,1,1e-6,1e6);
disp('ʹ��ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x3_n,k3_n)
%��ţ�ٷ�
[x3_ns,k3_ns]=Newton_method(y3,0,2,1e-6,1e6);
disp('ʹ�ü�ţ�ٷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x3_ns,k3_ns)
%�ҷ�
[x3_s,k3_s]=Secant_method(y3,0,1,1e6);
disp('ʹ���ҷ��õ��Ľ��Ϊ��')
fprintf('x=%.6f,��������%d\n\n',x3_s,k3_s)
%��֤
x3_0=fzero(y3,[0 1]);
disp('ʹ��fzero��֤�õ��Ľ��Ϊ��')
fprintf('x=%.6f\n',x3_0)