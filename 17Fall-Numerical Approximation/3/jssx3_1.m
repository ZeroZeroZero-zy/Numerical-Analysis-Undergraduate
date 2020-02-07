clc
clear

syms x t
f=3*sin(x)+2*cos(x);
a=-pi;
b=pi;
n1=10;
n2=20;
n3=30;
n4=40;

f_=matlabFunction(subs(f,x,(b-a)*t+a));
Bnf_1=getBernstein(f_,n1);
Bnf_2=getBernstein(f_,n2);
Bnf_3=getBernstein(f_,n3);
Bnf_4=getBernstein(f_,n4);

pnf1=simplify(subs(Bnf_1,t,(x-a)/(b-a)));
pnf2=simplify(subs(Bnf_2,t,(x-a)/(b-a)));
pnf3=simplify(subs(Bnf_3,t,(x-a)/(b-a)));
pnf4=simplify(subs(Bnf_4,t,(x-a)/(b-a)));

p1=matlabFunction(-simplify(abs(f-pnf1)));
p2=matlabFunction(-simplify(abs(f-pnf2)));
p3=matlabFunction(-simplify(abs(f-pnf3)));
p4=matlabFunction(-simplify(abs(f-pnf4)));

x1=fminbnd(p1,a,b);
x2=fminbnd(p2,a,b);
x3=fminbnd(p3,a,b);
x4=fminbnd(p4,a,b);

p1_max=-p1(x1);
p2_max=-p2(x2);
p3_max=-p3(x3);
p4_max=-p4(x4);

%结果
disp('sup|f-pn|随n的变化情况为')
fprintf('  n    sup|f-pn|\n')
fprintf('%3d    %7.6f\n',n1,p1_max)
fprintf('%3d    %7.6f\n',n2,p2_max)
fprintf('%3d    %7.6f\n',n3,p3_max)
fprintf('%3d    %7.6f\n\n',n4,p4_max)

%画图
figure('Name','3_1')
fplot(matlabFunction(f),[a b],'k')
hold on
fplot(matlabFunction(pnf1),[a b],'r')
hold on
fplot(matlabFunction(pnf2),[a b],'g')
hold on
fplot(matlabFunction(pnf3),[a b],'b')
hold on
fplot(matlabFunction(pnf4),[a b],'m')
legend('f(x)','n1=10多项式','n2=20多项式','n3=30多项式','n4=40多项式')
title('f(x)=3sin(x)+2cos(x)图像与pn(x)图像对比')