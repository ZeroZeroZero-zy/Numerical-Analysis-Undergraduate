clc
clear
close all

f=@(x)pi^2*sin(pi*x/2)/2;
p=@(x)1;
q=@(x)pi^2/4;
a=0;
b=1;
alpha=0;
beta=0;

n1=8;
n2=16;
n3=32;

u1=ConservationDifference1(f,p,q,a,b,n1,alpha,beta);
u2=ConservationDifference1(f,p,q,a,b,n2,alpha,beta);
u3=ConservationDifference1(f,p,q,a,b,n3,alpha,beta);

x=[1/8 3/8 5/8 7/8]';
u=@(x)sin(pi*x/2);
u0=u(x);

%问2）
u_n1=getuh4_1(u1,a,b,x);
u_n2=getuh4_1(u2,a,b,x);
u_n3=getuh4_1(u3,a,b,x);

figure('Name','4-2-1')
data_=[x u_n1 u_n2 u_n3 u0];%表格数据
ColumnName_={'x','u8(x)','u16(x)','u32(x)','u*(x)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])

x_temp=a:0.01:b;
y_temp=getuh4_1(u3,a,b,x_temp);
figure('Name','4-2-2')
plot(x_temp,y_temp,'-r')
hold on
fplot(u,[a b],'-k')
legend('u32(x)','u(x)')
title('u32(x)图像与精确解图像')

%问3）
u2n3=ConservationDifference1(f,p,q,a,b,2*n3,alpha,beta);
u_2n3=getuh4_1(u2n3,a,b,x);

figure('Name','4-2-3')
data_=[x u0-u_n1 (u0-u_n1)./(u0-u_n2) u0-u_n2 (u0-u_n2)./(u0-u_n3) u0-u_n3 (u0-u_n3)./(u0-u_2n3)];%表格数据
ColumnName_={'x','e8(x)','e8(x)/e16(x)','e16(x)','e16(x)/e32(x)','e32(x)','e32(x)/e64(x)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
