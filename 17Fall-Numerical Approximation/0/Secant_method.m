function [x,k]=Secant_method(f,a,b,N)
x=b-f(b)/((f(b)-f(a))/(b-a));  %x2
x2=x;
x=x-f(x)/((f(x)-f(b))/(x-b));  %x3
x1=x;
x=x2;
k=3;
while norm(f(x))>eps
    x=x1-f(x1)/((f(x1)-f(x2))/(x1-x2));
    x2=x1;
    x1=x;
    k=k+1;
    if k>=N
        disp('迭代步数过多')
        return
    end
end
end