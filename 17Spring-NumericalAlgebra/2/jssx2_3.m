clc;
clear;
%输入
A_4=getA2_3(4); 
A_6=getA2_3(6);

%(2)
%求解
disp('2_3(2)结果为')
[L4,U4,P4]=getLUP2_3(A_4)
[L6,U6,P6]=getLUP2_3(A_6)
%验证
disp('使用lu验证如下')
[L4_0,U4_0,P4_0]=lu(A_4)
[L6_0,U6_0,P6_0]=lu(A_6)

%(3)
x1=[1 5 0 6 1 3]';
b=A_6*x1;
disp('2_3(3)结果为')
x=LUsolve2_3(A_6,b)
disp('正确结果为')
x1