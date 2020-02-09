clc
clear
close all

f=@(x,y)x/y;
g=@(x)sqrt(1+x.^2);
a=0;
b=1;
h=0.1;
y0=1;

y1=EulerForward(f,y0,a,b,h);
y2=EulerBack(f,y0,a,b,h);
y3=EulerImprove(f,y0,a,b,h);

x=(a:h:b)';

data_=[x y1 y2 y3 g(x)];%�������
ColumnName_={'x','��ǰŷ����','���ŷ����','�Ľ�ŷ����','��ȷ��'};%��������
ColumnFormat_={'short','short e','short e','short e','short e'};%���и�ʽ
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
