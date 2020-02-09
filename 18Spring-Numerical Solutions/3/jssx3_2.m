clc
clear
close  all

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

x_n1=a:(b-a)/n1:b;
x_n2=a:(b-a)/n2:b;
x_n3=a:(b-a)/n3:b;

x=[1/8 3/8 5/8 7/8]';
u=@(x)sin(pi*x/2);
u0=u(x);

u1=LinearElement_Ritz(f,p,q,alpha,beta,x_n1);
u_n1=getu3_2(u1,x_n1,x);
u2=LinearElement_Ritz(f,p,q,alpha,beta,x_n2);
u_n2=getu3_2(u2,x_n2,x);
u3=LinearElement_Ritz(f,p,q,alpha,beta,x_n3);
u_n3=getu3_2(u3,x_n3,x);

%问2）
figure('Name','3-2-1')
data_=[x u_n1 u_n2 u_n3 u0];%表格数据
ColumnName_={'x','u8(x)','u16(x)','u32(x)','u*(x)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])

x_temp=a:0.01:b;
y_temp=getu3_2(u3,x_n3,x_temp);
figure('Name','3-2-2')
plot(x_temp,y_temp,'-r')
hold on
fplot(u,[a b],'-k')
legend('u32(x)','u(x)')
title('u32(x)图像与精确解图像')

%问3）
u2n3=LinearElement_Ritz(f,p,q,alpha,beta,a:(b-a)/(2*n3):b);
u_2n3=getu3_2(u2n3,a:(b-a)/(2*n3):b,x);

figure('Name','3-2-3')
data_=[x u0-u_n1 (u0-u_n1)./(u0-u_n2) u0-u_n2 (u0-u_n2)./(u0-u_n3) u0-u_n3 (u0-u_n3)./(u0-u_2n3)];%表格数据
ColumnName_={'x','e8(x)','e8(x)/e16(x)','e16(x)','e16(x)/e32(x)','e32(x)','e32(x)/e64(x)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
