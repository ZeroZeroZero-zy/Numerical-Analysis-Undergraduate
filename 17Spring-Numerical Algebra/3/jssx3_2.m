clc;
clear;
%
N=10;
h=0.1;
A=getA3_2(N);
b=getb3_2(N,h);
x0=ones(N-1,1);
k=10000;
omega=3/2;
eps=1e-6;
%
[xj,j]=Jacobi(A,b,x0,eps,k)
[xg,g]=GaussSeidel(A,b,x0,eps,k)
[xs,s]=SOR(A,b,x0,eps,k,omega)
%
answer=A\b
rate=j/g
n=size(A,1);
D=diag(diag(A));
B=eye(n)-D\A;
omega_opt=2/(1+sqrt(1-vrho(B)^2))
omega_opt1=2/(1+sin(pi*h))