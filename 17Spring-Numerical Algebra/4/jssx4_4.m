clc;
clear;

A=[ 8 -1  3 -1;
   -1  6  2  0;
    3  2  9  1;
    -1 0  1  7];
eps=1e-6;
sigma=2;

[V_C,D_C,k_C]=ClassicalJacobi(A,eps)
[V_T,D_T,k_T]=ThresholdJacobi(A,eps,sigma)
[V,D]=eig(A)