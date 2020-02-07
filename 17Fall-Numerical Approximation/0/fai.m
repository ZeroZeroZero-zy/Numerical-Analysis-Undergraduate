function [x,k]=fai(f,x0,eps,N)
syms t
p=@(t)1/diff(f(t));
q=@(t)diff(f(t),2)/(2*(diff(f(t)))^3);
fai=@(t)t-p(t)*f(t)-q(t)*(f(t))^2;
x1=x0;
x=double(subs(fai(t),t,x0));
k=1;
while norm(x-x1)>=eps
    x1=x;
    x=double(subs(fai(t),t,x));
    k=k+1;
    if k>=N
        disp('迭代步数过多')
        return
    end
end
end