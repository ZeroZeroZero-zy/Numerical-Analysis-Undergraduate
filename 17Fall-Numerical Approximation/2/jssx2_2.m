clc
clear

%���
f=@(x)1./(1+x.^2);
x=linspace(-5,5,11);
y=f(x);
y0_1=0.0148;
yN_1=-0.0148;
[A,d]=getAd2_2(x,y,y0_1,yN_1);
M=LUsolve2_3(A,d);
M1=getM2_1(A,d);
disp('�Ա����ַ����õ���M��')
disp('      M         M1')
disp([M M1])  %�Ա����ַ����õ���M
x1=-5:0.001:5;
y1=getS2_1(x,y,M,x1);

%��ͼ
figure('Name','2_2')
plot(x1,f(x1),'-k')
hold on
plot(x,y,'o',x1,y1,'-r')
legend('f(x)','��ֵ���','����������ֵ����ͼ��')
title('f(x)=1/(1+x^2)ͼ��������������ֵ����ͼ�ζԱ�')