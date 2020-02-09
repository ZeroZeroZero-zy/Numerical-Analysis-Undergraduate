clc
clear
close all

f=@(x,y)(2+pi*x-x^2)*sin(y);
N_=[4 8 16 32];

x0=(1:3)*pi/4;
y0=(1:3)*pi/4;
u0=@(x,y)(pi*x-x^2)*sin(y);

U0=zeros(3);
for i=1:3
    for j=1:3
        U0(i,j)=u0(x0(i),y0(j));
    end
end

for c=1:4
    N=N_(c);
    
    [U,B]=getUB4_3(f,N,x0,y0);
    
    figure()
    data_=abs(U0-B);%表格数据
    ColumnName_={'pi/4','2*pi/4','3*pi/4'};%各列名称
    RowName_={'pi/4','2*pi/4','3*pi/4'};
    ColumnFormat_={'short','short','short'};%各列格式
    uitable('data',data_,'ColumnName',ColumnName_,'RowName',RowName_,'ColumnFormat',ColumnFormat_,'Position',[20 20 500 200])
end

