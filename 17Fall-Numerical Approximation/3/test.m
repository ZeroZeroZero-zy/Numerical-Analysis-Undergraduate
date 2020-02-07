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

p1=simplify(f-pnf1);
p2=simplify(f-pnf2);
p3=simplify(f-pnf3);
p4=simplify(f-pnf4);

s=a:0.01:b;
p1_max=max(double(subs(p1,x,s)));
p2_max=max(double(subs(p2,x,s)));
p3_max=max(double(subs(p3,x,s)));
p4_max=max(double(subs(p4,x,s)));