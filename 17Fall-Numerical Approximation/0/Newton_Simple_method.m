function [x,k]=Newton_Simple_method(f,a,b,eps,N)
x=(a+b)/2;
x0=x;
syms t
c=double(subs(diff(f(t)),t,x0));
x1=x;
x=x-f(x)/c;
k=1;
while norm(x-x1)>eps
    x1=x;
    x=x-f(x)/c;
    k=k+1;
    if k>=N
        disp('迭代步数过多')
        return
    end
end
end