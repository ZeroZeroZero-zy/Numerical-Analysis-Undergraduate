function [p]=Lagrange_Interpolation1_3(x,y)
n=size(x,2);
syms t
p=0;
for i=1:n
    c=1/(t-x(i));
    d=1;
    for j=1:n
        c=c*(t-x(j));
        if j==i
            continue
        else
            d=d*(x(i)-x(j));
        end
    end
    l=c/d;
    p=p+y(i)*l;
end
p=simplify(p);
end