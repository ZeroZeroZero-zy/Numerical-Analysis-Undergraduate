clc
clear

%���
x=[1 2 3 4 5 6 7 8 9 10];
y=[244 221 208 208 211.5 216 219 221 221.5 220];
x0=7.613;
[A,d]=getAd2_1(x,y);
M=LUsolve2_3(A,d); %ʹ��׷�Ϸ��ⷽ����
M1=getM2_1(A,d);
disp('�Ա����ַ����õ���M��')
disp('      M         M1')
disp([M M1])  %�Ա����ַ����õ���M
S=getS2_1(x,y,M,x0);
S1=spline(x,y,x0);
x1=1:0.01:10;
y1=getS2_1(x,y,M,x1);
y2=spline(x,y,x1);

%���
disp('ʹ��ѧ�Ź���ĵ�Ϊx_c=7.613')
disp('ʹ������������ֵ�õ��Ľ��Ϊ��')
fprintf('s(x_c)=%.6f\n',S)
disp('ʹ��spline��֤�õ��Ľ��Ϊ��')
fprintf('s(x_c)=%.6f\n',S1)

%��ͼ
figure('Name','7_1')
plot(x,y,'o',x1,y1,'-r')
hold on
plot(x1,y2,':k')
legend('��ֵ���','����������ֵ����ͼ��','spline��֤')
title('����������ֵ����ͼ��')