clc
clear
close all

syms x;
f=-x^2-2;
p=-1;
q=1;
a=0;
b=1;

n1=5;
n2=8;
phi1=getphi2_1(n1);
phi2=getphi2_1(n2);
[u1]=RG_method(f,phi1,p,q,a,b);
[u2]=RG_method(f,phi2,p,q,a,b);
u1=matlabFunction(u1);
u2=matlabFunction(u2);

x0=[1/4,1/2,3/4,0.613]';
u=@(x)sin(x)./sin(1)-x.^2;

figure('Name','2-1')
data_=[x0 u1(x0) u2(x0) u(x0)];%�������
ColumnName_={'x','u5(x)','u8(x)','u*(x)'};%��������
ColumnFormat_={'short','short e','short e','short e','short e'};%���и�ʽ
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
