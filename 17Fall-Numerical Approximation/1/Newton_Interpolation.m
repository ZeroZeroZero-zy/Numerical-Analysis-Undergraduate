function [y0]=Newton_Interpolation(x,y,x0)
n=length(x);
D=Difference_Quotient(x,y);
d=diag(D);
syms t
N=d(1);
c=1;
for i=2:n
    c=c*(t-x(i-1));
    N=N+c*d(i);
end
y0=double(subs(N,t,x0));
end