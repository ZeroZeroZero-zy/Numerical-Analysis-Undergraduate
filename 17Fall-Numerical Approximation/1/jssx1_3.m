clc
clear

n1=5;
n2=10;
n3=20;
f=@(x)1./(1+x.^2);
a=-5;
b=5;

[x1,y1]=getxy1_3(n1,a,b,f);
[x2,y2]=getxy1_3(n2,a,b,f);
[x3,y3]=getxy1_3(n3,a,b,f);

syms t
p_1=Lagrange_Interpolation1_3(x1,y1);
p_2=Lagrange_Interpolation1_3(x2,y2);
p_3=Lagrange_Interpolation1_3(x3,y3);

figure('Name','1_3')
fplot(matlabFunction(p_1),[a b],'-r');
hold on
fplot(matlabFunction(p_2),[a b],'--g');
hold on
fplot(matlabFunction(p_3),[a b],':xb');
hold on
fplot(f,[a b],'-k')
hold on
plot(x3,y3,'mo',x1,y1,'ko',x2,y2,'co')
axis([a b -2 2])
legend('5次Lagrange插值多项式','10次Lagrange插值多项式','20次Lagrange插值多项式','f(x)','插值结点')
title('f(x)=1/(1+x^2)图像与Lagrange插值多项式图像对比')
