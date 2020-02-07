clc;
clear;
%输入
A1=[2 4 -2;1 -1 5;4 1 -2];
A2=[3 1 0;9 3 1;0 9 3];
A3=[1 2 1 -2;2 5 3 -2;-2 -2 3 5;1 3 2 3];
%求解
[L1,U1,B1,d1]=Doolittle(A1)

[L3,U3,B3,d3]=Doolittle(A3)
%验证
B_1=inv(A1)
d_1=det(A1)
B_2=inv(A2)
d_2=det(A2)
B_3=inv(A3)
d_3=det(A3)

[L2,U2,B2,d2]=Doolittle(A2)