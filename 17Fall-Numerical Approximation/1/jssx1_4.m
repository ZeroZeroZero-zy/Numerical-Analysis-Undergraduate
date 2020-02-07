clc
clear

%���
n=20;
f=@(x)1./(1+x.^2);
g=@(x)-2*x./(1+x.^2).^2;
a=-5;
b=5;
[x,y,y_1]=getxyy1_4(n,a,b,f,g);
x0=3.7613;
p=getp1_4(x,y,x0);
H=getH1_4(x,y,y_1,x0);
x1=-5:0.01:5;
y1=getp1_4(x,y,x1);
y2=getH1_4(x,y,y_1,x1);

%���
disp('ʹ��ѧ�Ź���ĵ�Ϊx=3.7613')
disp('�õ㴦����ֵΪ��')
fprintf('f(x)=%.6f\n',f(x0))
disp('ʹ�÷ֶ����Բ�ֵ�õ��Ľ��Ϊ��')
fprintf('p(x)=%.6f\n',p)
disp('ʹ�÷ֶ�����Hermite��ֵ�õ��Ľ��Ϊ��')
fprintf('H(x)=%.6f\n',H)

%��ͼ
figure('Name','6_4')
plot(x1,f(x1),'-k')
hold on
plot(x,y,'ob')
hold on
plot(x1,y1,'-r')
hold on
plot(x1,y2,'-g')
legend('f(x)','��ֵ���','�ֶ����Բ�ֵ����ʽ','�ֶ�����Hermite��ֵ')
title('f(x)=1/(1+x^2)ͼ����ֶ����Բ�ֵ����ʽ���ֶ�����Hermite��ֵ����ʽͼ��Ա�')
