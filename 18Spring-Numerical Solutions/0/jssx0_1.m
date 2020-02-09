clc
clear
close all

f=@exp;
a=0;
b=1;
I=exp(1)-1;
n=[2 4 8 16 32 64]';
p=length(n);
I1=zeros(p,1);
I2=zeros(p,1);
R1=zeros(p,1);
R2=zeros(p,1);

for i=1:p
    I1(i)=Composite_Trapezium(f,a,b,n(i));
    R1(i)=I-I1(i);
    I2(i)=Composite_Simpson(f,a,b,n(i));
    R2(i)=I-I2(i);
end

data_=[n I1 R1 I2 R2];%表格数据
ColumnName_={'n','In(f)','Rn(f)','In(f)','Rn(f)'};%各列名称
ColumnFormat_={'short','short e','short e','short e','short e'};%各列格式
uitable('data',data_,'ColumnName',ColumnName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
