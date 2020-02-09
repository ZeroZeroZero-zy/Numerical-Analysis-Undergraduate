clc
clear
close all

f=@(t,y,z)-9*y+6*cos(3*t);
a=0;
b=1;
h=0.05;
y0=0;
z0=0;

[y,z]=EulerForward1_4(f,y0,z0,a,b,h);
[y1,z1]=EulerImprove1_4(f,y0,z0,a,b,h);

yt=@(t)t.*sin(3*t);
yt1=@(t)sin(3*t)+3*t.*cos(3*t);

t=0:h:1;

figure('Name','1-4-1')
plot(t,y,'-r',t,y1)
hold on
fplot(yt,[a b],'-k')
legend('向前Eluer法','改进Euler法','精确解')
title('位移y数值解')

figure('Name','1-4-2')
plot(t,z,'-r',t,z1)
hold on
fplot(yt1,[a b],'-k')
legend('向前Eluer法','改进Euler法','精确解')
title('速度y(1)数值解')

figure(3)
data_=[t' y y1 yt(t') z z1 yt1(t')];%表格数据
ColumnName_={'t','y向前Eluer法','y改进Euler法','y精确解','y(1)向前Eluer法','y(1)改进Euler法','y(1)精确解'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 650 450])