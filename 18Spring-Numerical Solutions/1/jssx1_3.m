clc
clear
close all

f=@(x,y)-8*y+8.125*cos(x);
g=@(x)0.125*x+cos(x);
a=0;
b=2;
h=0.1;
y0=1;

y1=RK_method(f,y0,a,b,h);
y=y1(1:4);
y2=AdamsOut(f,y,a,b,h);
y3=AdamsIn(f,y,a,b,h);

n=(b-a)/h+1;
x=(a:h:b)';

disp([y1 y2 y3 g(x)])

figure('Name','1-3')
fplot(g,[a b],'-k')
hold on
plot(x,y1,'mo',x,y2,'ro',x,y3,'bx')
legend('精确解','RK法','Adams外插','Adams内插')
title('预估-矫正方法')

figure(2)
data_=[x y1 y2 y3 g(x)];%表格数据
ColumnName_={'x','RK法','Adams外插法','Adams内插法','精确解'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])