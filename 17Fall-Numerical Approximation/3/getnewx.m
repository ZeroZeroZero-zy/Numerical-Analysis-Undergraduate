function [x0]=getnewx(x0,a,b,f,P)
syms x
m=length(x0);
Diff=matlabFunction(-simplify(abs(f(x)-P)));
if P==0
    P_n_1=@(x)0;
else
    P_n_1=matlabFunction(P);
end
x_=fminbnd(Diff,a,b);
if x_>=a&&x_<=x0(1)
    if (f(x0(1))-P_n_1(x0(1)))*(f(x_)-P_n_1(x_))>0
        x0(1)=x_;
    else
        for i=m:-1:2
            x0(i)=x0(i-1);
        end
        x0(1)=x_;
    end
elseif x_>=x0(m)&&x_<=b
    if (f(x0(1))-P_n_1(x0(1)))*(f(x_)-P_n_1(x_))>0
        x0(m)=x_;
    else
        for i=1:m-1
            x0(i)=x0(i+1);
        end
        x0(m)=x_;
    end
else
    for i=1:m-1
        if x_>=x0(i)&&x_<=x0(i+1)
            a=i;
        else
            continue
        end
    end
    if (f(x0(a))-P_n_1(x0(a)))*(f(x_)-P_n_1(x_))>0
        x0(a)=x_;
    else
        x0(a+1)=x_;
    end
end
end