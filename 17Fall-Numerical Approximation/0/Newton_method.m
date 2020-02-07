function [x,k]=Newton_method(f,a,b,eps,N)
syms t
x=(a+b)/2;
x1=x;
x=double(x-f(x)/subs(diff(f(t)),t,x));
k=1;
while norm(x-x1)>eps
    x1=x;
    x=double(x-f(x)/subs(diff(f(t)),t,x));
    k=k+1;
    if k>=N
        disp('迭代步数过多');
        return
    end
end
end