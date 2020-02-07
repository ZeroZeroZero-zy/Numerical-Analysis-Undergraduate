clc
clear

f=@exp;
a=-1;
b=1;
n=40;
eps=1e-10;
P=Remez3_4(f,a,b,n,eps);

%��ͼ
figure('Name','3_2')
fplot(f,[a b],'-k')
hold on
fplot(matlabFunction(P),[a b],'xr')
hold on
ylim=get(gca,'Ylim');
plot([0,0],ylim,'--');
legend('f(x)','����ʽ')
title('f(x)=e^xͼ����Pn-1(x)ͼ�ζԱ�')