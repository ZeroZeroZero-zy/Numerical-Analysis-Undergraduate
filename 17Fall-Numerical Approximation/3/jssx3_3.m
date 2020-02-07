clc
clear

syms x
a=-1;
b=1;
eps=1e-10;
n1=10;
n2=20;
f1=@(x)x.^n1;
f2=@(x)x.^n2;

T1=cos(n1*acos(x))/2^(n1-1);
T2=cos(n2*acos(x))/2^(n2-1);
pn1=x^n1-Remez3_4(f1,a,b,n1,eps);
pn2=x^n2-Remez3_4(f2,a,b,n2,eps);

%画图
figure('Name','3_3_1')
fplot(matlabFunction(T1),[a b],'k')
hold on
fplot(matlabFunction(pn1),[a b],'xr')
hold on
fplot(matlabFunction(T1-pn1),[a b],'-b')
legend('Tn(x)/2^n-1','x^n-p*n-1(x)')
title('n1=10次最小零偏差多项式验证')

figure('Name','3_3_2')
fplot(matlabFunction(T2),[a b],'k')
hold on
fplot(matlabFunction(pn2),[a b],'xr')
hold on
fplot(matlabFunction(T2-pn2),[a b],'-b')
legend('Tn(x)/2^n-1','x^n-p*n-1(x)')
title('n2=20次最小零偏差多项式验证')