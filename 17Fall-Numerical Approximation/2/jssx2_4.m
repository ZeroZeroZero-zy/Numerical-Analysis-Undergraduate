clc
clear

%���
x=[0.25 0.3 0.39 0.45 0.53];
y=[0.5 0.5477 0.6245 0.6708 0.728];
y0_1=1;
yN_1=0.6868;
[A,d]=getAd2_4(x,y,y0_1,yN_1);
m=LUsolve2_3(A,d); %ʹ��׷�Ϸ��ⷽ����
m1=getM2_1(A,d);
disp('�Ա����ַ����õ���m')
disp('      m         m1')
disp([m m1])  %�Ա����ַ����õ���m
x1=0.25:0.001:0.53;
y1=getS2_4(x,y,m,x1);
x2=getx2_4(x);
y2=getS2_4(x,y,m,x2);
y3=spline(x,y,x2);
y4=spline(x,y,x1);

%���
disp('�Ѹ����ݣ�')
fprintf(' x    %5.4f     %5.4f     %5.4f     %5.4f     %5.4f\n',x(1),x(2),x(3),x(4),x(5))
fprintf('f(x)  %5.4f     %5.4f     %5.4f     %5.4f     %5.4f\n\n',y(1),y(2),y(3),y(4),y(5))
disp('ÿ���е㼰����ֵ��')
fprintf(' x    %5.4f     %5.4f     %5.4f     %5.4f\n',x2(1),x2(2),x2(3),x2(4))
fprintf('s(x)  %5.4f     %5.4f     %5.4f     %5.4f\n',y2(1),y2(2),y2(3),y2(4))
fprintf('s1(x) %5.4f     %5.4f     %5.4f     %5.4f\n\n',y3(1),y3(2),y3(3),y3(4))

%��ͼ
figure('Name','7_4')
plot(x,y,'o',x1,y1,'-r',x2,y2,'b+')
hold on
plot(x1,y4,':k')
legend('��ֵ���','����������ֵ����ͼ��','����е�','spline��֤')
title('����������ֵ����ͼ��')