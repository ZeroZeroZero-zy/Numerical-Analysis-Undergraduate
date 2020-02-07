clc;
clear;

n1=5;
n2=10;
[A1,b1]=getAb0_1(n1);
[A2,b2]=getAb0_1(n2);

tic
x1=Cramer0_1(A1,b1)
toc

tic
x2=Cramer0_1(A2,b2)
toc