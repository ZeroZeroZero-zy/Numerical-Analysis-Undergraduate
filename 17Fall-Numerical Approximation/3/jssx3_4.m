clc
clear

syms x t
f=@(x)1./(1+(10.*x-5).^2);
a=0;
b=1;
n1=5;
n2=10;
n3=20;
eps=1e-10;

Bnf1=getBernstein(f,n1);
Bnf2=getBernstein(f,n2);
Bnf3=getBernstein(f,n3);

P1=Remez3_4(f,a,b,n1+1,eps);
P2=Remez3_4(f,a,b,n2+1,eps);
P3=Remez3_4(f,a,b,n3+1,eps);

d1_B=getdelta3_4(Bnf1,f(t),a,b);
d1_p=getdelta3_4(P1,f(x),a,b);
d2_B=getdelta3_4(Bnf2,f(t),a,b);
d2_p=getdelta3_4(P2,f(x),a,b);
d3_B=getdelta3_4(Bnf3,f(t),a,b);
d3_p=getdelta3_4(P3,f(x),a,b);

%结果
disp('Bernstein多项式与n次最佳一致逼近多项式对于f的偏差：')
fprintf('  n    delta(Bnf,f)    delta(pn,f)\n')
fprintf('%3d    %7.6f        %7.6f\n',n1,d1_B,d1_p)
fprintf('%3d    %7.6f        %7.6f\n',n2,d2_B,d2_p)
fprintf('%3d    %7.6f        %7.6f\n',n3,d3_B,d3_p)

%画图
figure('Name','3_4_1')
fplot(matlabFunction(f(t)-Bnf1),[a b],'k')
hold on
fplot(matlabFunction(f(x)-P1),[a b],'r')
legend('f(x)-Bnf(x)','f(x)-pn(x)')
title('n=5 f(x)-Bnf(x)与f(x)-pn(x)图像')

figure('Name','3_4_2')
fplot(matlabFunction(f(t)-Bnf2),[a b],'k')
hold on
fplot(matlabFunction(f(x)-P2),[a b],'r')
legend('f(x)-Bnf(x)','f(x)-pn(x)')
title('n=10 f(x)-Bnf(x)与f(x)-pn(x)图像')

figure('Name','3_4_3')
fplot(matlabFunction(f(t)-Bnf3),[a b],'k')
hold on
fplot(matlabFunction(f(x)-P3),[a b],'r')
legend('f(x)-Bnf(x)','f(x)-pn(x)')
title('n=20 f(x)-Bnf(x)与f(x)-pn(x)图像')