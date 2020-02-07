function [x0,k]=Bisection_method(f,a,b,eps,N)
c=(a+b)/2;
k=1;
while k<=N
    if f(c)==0
        break
    elseif norm(c-a)<=eps
        break
    elseif f(a)*f(c)>0
        a=c;
    elseif f(a)*f(c)<=0 
        b=c;
    end
    c=(a+b)/2;
    k=k+1;
end
x0=c;
end