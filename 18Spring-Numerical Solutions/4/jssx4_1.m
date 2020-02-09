clc
clear
close all

f=@(x)-x.^2./2-1;
q=@(x)1;
a=0;
b=1;
alpha=0;
beta=tan(1)-1/2;

n1=10;
n2=20;

xc=0.8613;
x=[0.25 0.5 0.75 xc]';
u0=@(x)sin(x)/cos(1)-x.^2./2;

u1=CenteredDifference(f,q,a,b,n1,alpha,beta);
u2=CenteredDifference(f,q,a,b,n2,alpha,beta);

uh1=getuh4_1(u1,a,b,x);
uh2=getuh4_1(u2,a,b,x);
uh=u0(x);

figure('Name','4-1')
data_=[x uh1 uh2 uh];%表格数据
ColumnName_={'x','u10(x)','u20(x)','u*(x)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
