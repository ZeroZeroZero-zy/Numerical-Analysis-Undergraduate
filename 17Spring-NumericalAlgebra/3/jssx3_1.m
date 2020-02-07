clc;
clear;
%
A1=[1 0.9 0.9;0.9 1 0.9;0.9 0.9 1];
A2=[1 0 1;-1 1 0;1 2 -3];
A3=[8 -1 1;2 10 -1;1 1 5];
b=[6;1;3];
b1=A1*b;
b2=A2*b;
b3=A3*b;
x0=zeros(3,1);
N=10000;
eps=1e-6;
%
[x1_j,j1]=Jacobi(A1,b1,x0,eps,N)
[x1_g,g1]=GaussSeidel(A1,b1,x0,eps,N)
[x2_j,j2]=Jacobi(A2,b2,x0,eps,N)
[x2_g,g2]=GaussSeidel(A2,b2,x0,eps,N)
[x3_j,j3]=Jacobi(A3,b3,x0,eps,N)
[x3_g,g3]=GaussSeidel(A3,b3,x0,eps,N)