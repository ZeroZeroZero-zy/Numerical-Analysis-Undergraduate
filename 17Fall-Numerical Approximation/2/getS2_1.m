function [S]=getS2_1(x,y,M,x0) 
n=length(x);
m=length(x0);

if m==1
    S=0;
    for i=1:n-1
        if x0>=x(i)&&x0<=x(i+1)
            h=x(i+1)-x(i);
            S=M(i)*(x(i+1)-x0)^3/(6*h)+...
                M(i+1)*(x0-x(i))^3/(6*h)+...
                (y(i)-M(i)*h^2/6)*(x(i+1)-x0)/h+...
                (y(i+1)-M(i+1)*h^2/6)*(x0-x(i))/h;
        else
            continue
        end
    end
end

if m>=2
    S=zeros(1,m);
    for j=1:m
        for i=1:n-1
            if x0(j)>=x(i)&&x0(j)<=x(i+1)
                h=x(i+1)-x(i);
                S(j)=M(i)*(x(i+1)-x0(j))^3/(6*h)+...
                    M(i+1)*(x0(j)-x(i))^3/(6*h)+...
                    (y(i)-M(i)*h^2/6)*(x(i+1)-x0(j))/h+...
                    (y(i+1)-M(i+1)*h^2/6)*(x0(j)-x(i))/h;
            else
                continue
            end
        end
    end
end
end