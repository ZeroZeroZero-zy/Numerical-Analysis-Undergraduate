function [P,mu]=getnewP(x0,f)
m=length(x0);
y=zeros(m,1);
for i=1:m
    y(i)=(-1)^(i+1);
end
D_f=diag(Difference_Quotient(x0,f(x0)));
D_h=diag(Difference_Quotient(x0,y));
mu=-D_f(m)/D_h(m);
D_P=zeros(m,1);
for i=1:m
    D_P(i)=D_f(i)+D_h(i)*mu;
end
syms x
P=D_P(1);
c=1;
for i=2:m
    c=c*(x-x0(i-1));
    P=P+c*D_P(i);
end
P=simplify(P);
end