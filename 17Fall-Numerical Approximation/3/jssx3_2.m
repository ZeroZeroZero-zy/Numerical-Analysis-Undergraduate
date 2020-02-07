clc
clear

f=@exp;
a=-1;
b=1;
n=40;
eps=1e-10;
P=Remez3_4(f,a,b,n,eps);

%画图
figure('Name','3_2')
fplot(f,[a b],'-k')
hold on
fplot(matlabFunction(P),[a b],'xr')
hold on
ylim=get(gca,'Ylim');
plot([0,0],ylim,'--');
legend('f(x)','多项式')
title('f(x)=e^x图像与Pn-1(x)图形对比')