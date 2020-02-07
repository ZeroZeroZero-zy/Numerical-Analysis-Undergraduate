clc;
clear;

A=[ 8 -1  3 -1;
   -1  6  2  0;
    3  2  9  1;
    -1 0  1  7];
eps=1e-6;
sigma=20;

[V,D,k]=ThresholdJacobi(A,eps,sigma)
[V0,D0]=eig(A)