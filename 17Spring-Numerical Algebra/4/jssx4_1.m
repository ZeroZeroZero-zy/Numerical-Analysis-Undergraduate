clc;
clear;
%输入
A1=[7 3 -2;3 4 -1;-2 -1 3];
A2=[0 11 -5;-2 17 -7;-4 26 -10];
z0=[1 1 1]';
eps=1e-6;
%求解
disp('运行结果如下')
[z1,m1,k1]=PowerMethod(A1,z0,eps)
[z2,m2,k2]=PowerMethod(A2,z0,eps)
[z1_r,r1,k1_r]=PowerMethodRayleigh(A1,z0,eps)
[z2_r,r2,k2_r]=PowerMethodRayleigh(A2,z0,eps)
row1_P=m1
row2_P=m2
row1_R=r1
row2_R=r2
[z12,m12,k12]=PowerMethod(A1'*A1,z0,eps);
[z22,m22,k22]=PowerMethod(A2'*A2,z0,eps);
[z12_r,r12,k12_r]=PowerMethodRayleigh(A1'*A1,z0,eps);
[z22_r,r22,k22_r]=PowerMethodRayleigh(A2'*A2,z0,eps);
A1_2_P=sqrt(m12)
A2_2_P=sqrt(m22)
A1_2_R=sqrt(r12)
A2_2_R=sqrt(r22)
%验证
disp('正确结果如下')
[V1,L1]=eig(A1)
[V2,L2]=eig(A2)
row1_0=vrho(A1)
row2_0=vrho(A2)
A1_2_0=norm(A1)
A2_2_0=norm(A2)