A1=[1 0.9 0.9;0.9 1 0.9;0.9 0.9 1];
A2=[1 0 1;-1 1 0;1 2 -3];
A3=[8 -1 1;2 10 -1;1 1 5];
x0=[0;0;0];
b=[6;1;3];
k=10000;

A=A1;
[x]=Jacobi(A,b,x0,k)
A=A3;
[x]=GaussSeidel(A,b,x0,k)

[x3,j3]=Jacobi(A3,b,x0,k)
[x3,g3]=GaussSeidel(A3,b,x0,k)
