clc;
clear;
%
A=eye(2);
B=-ones(2)/4;
x0=zeros(4,1);
b=getC3_3(A,B)*[0;6;1;3];
N=10000;
eps=1e-6;
%
[xj,j]=Jacobi3(A,B,b,x0,eps,N)
[xg,g]=GaussSeidel3(A,B,b,x0,eps,N)