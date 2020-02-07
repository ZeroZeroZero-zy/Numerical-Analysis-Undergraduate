function [X]=getX9_1(x,y,n)
%n次多项式最小二乘拟合
N=length(x);
syms t
phi=sym(zeros(n+1,1));
phi(1)=1;
for j=2:n+1
    phi(j)=phi(j-1)*t;
end
A=zeros(N,n+1);
for j=1:n+1
    for i=1:N
        A(i,j)=double(subs(phi(j),t,x(i)));
    end
end
A1=A'*A;
Y1=A'*y';
X=Cholsolve(A1,Y1);
end