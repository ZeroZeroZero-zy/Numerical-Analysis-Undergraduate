clc;
clear;
%����
A_4=getA2_3(4); 
A_6=getA2_3(6);

%(2)
%���
disp('2_3(2)���Ϊ')
[L4,U4,P4]=getLUP2_3(A_4)
[L6,U6,P6]=getLUP2_3(A_6)
%��֤
disp('ʹ��lu��֤����')
[L4_0,U4_0,P4_0]=lu(A_4)
[L6_0,U6_0,P6_0]=lu(A_6)

%(3)
x1=[1 5 0 6 1 3]';
b=A_6*x1;
disp('2_3(3)���Ϊ')
x=LUsolve2_3(A_6,b)
disp('��ȷ���Ϊ')
x1