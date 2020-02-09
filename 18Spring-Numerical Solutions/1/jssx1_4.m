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
legend('��ǰEluer��','�Ľ�Euler��','��ȷ��')
title('λ��y��ֵ��')

figure('Name','1-4-2')
plot(t,z,'-r',t,z1)
hold on
fplot(yt1,[a b],'-k')
legend('��ǰEluer��','�Ľ�Euler��','��ȷ��')
title('�ٶ�y(1)��ֵ��')

figure(3)
data_=[t' y y1 yt(t') z z1 yt1(t')];%�������
ColumnName_={'t','y��ǰEluer��','y�Ľ�Euler��','y��ȷ��','y(1)��ǰEluer��','y(1)�Ľ�Euler��','y(1)��ȷ��'};%��������
ColumnFormat_={'short','short e','short e','short e','short e','short e','short e'};%���и�ʽ
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 650 450])