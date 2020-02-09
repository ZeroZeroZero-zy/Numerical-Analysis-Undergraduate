clc
clear
close all

syms x;
f=2*x*cos(x)+2*sin(x)-x*cos(1);
p=1;
q=1;
a=0;
b=1;

n1=5;
n2=8;
phi1=getphi2_2(n1);
phi2=getphi2_2(n2);
[u1]=RG_method(f,phi1,p,q,a,b);
[u2]=RG_method(f,phi2,p,q,a,b);
u1=matlabFunction(u1);
u2=matlabFunction(u2);

x0=[1/4,1/2,3/4]';
u=@(x)x.*(cos(x)-cos(1));

disp([u1(x0) u2(x0) u(x0)])

figure('Name','2-2-1')
data_=[x0 u1(x0) u2(x0) u(x0)];%表格数据
ColumnName_={'x','u5(x)','u8(x)','u*(x)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200]);

% figure('Name','2-2-1')
% fplot(u,[0 1]);
% hold on
% fplot(u1,[0 1]);
% hold on
% fplot(u2,[0 1]);
% title('图像')