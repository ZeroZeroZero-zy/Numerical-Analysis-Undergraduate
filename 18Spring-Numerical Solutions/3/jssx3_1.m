clc
clear
close all

syms x
f=-x^2/2-1;
p=-1;
q=1;
a=0;
b=1;

n1=10;
n2=20;

xc=0.7613;
x=[0.25 0.5 0.75 xc]';
u=@(x)sin(x)./cos(1)-x.^2./2;

uh1=LinearElement_Galerkin(f,p,q,a,b,n1,x);
uh2=LinearElement_Galerkin(f,p,q,a,b,n2,x);
uh=u(x);

figure('Name','3-1')
data_=[x uh1 uh2 uh];%表格数据
ColumnName_={'x','n=10 uh(x)','n=20 uh(x)','u*(x)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
