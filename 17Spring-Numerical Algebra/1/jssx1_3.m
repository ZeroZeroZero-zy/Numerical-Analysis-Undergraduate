clc;
clear;

A=[ 1 1  1  1;
    1 2  3  4;
    1 3  6 10;
    1 4 10 20];

[G,Q]=Hessenberg(A)
[G0,Q0]=hess(A)