clc;
clear;

A=hilb(4);
x0=[1 6 1 3]';
b=A*x0;

[Q,R]=QR1_1(A)
x=QRsolve1_1(Q,R,b)