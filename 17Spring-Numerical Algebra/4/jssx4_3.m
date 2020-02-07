clc
clear

A=[4  2  2  1;
   2 -3  1  1;
   2  1  3  1;
   1  1  1  2];
eps=1e-6;

[V_B,D_B,k_B]=BasicalQR4_3(A,eps)
[V_P,D_P,k_P]=PracticalQR4_3(A,eps)
[V0,D0]=eig(A)

