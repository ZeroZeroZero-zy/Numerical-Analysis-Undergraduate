function [S]=getS2_4(x,y,m,x0) 
n=length(x);
m0=length(x0);

if m0==1
    S=0;
    for i=1:n-1
        if x0>=x(i)&&x0<=x(i+1)
            h=x(i+1)-x(i);
            S=y(i)*(1+2*(x0-x(i))/h)*((x0-x(i+1))/h)^2+...
                y(i+1)*(1+2*(x(i+1)-x0)/h)*((x0-x(i))/h)^2+...
                m(i)*(x0-x(i))*((x0-x(i+1))/h)^2+...
                m(i+1)*(x0-x(i+1))*((x0-x(i))/h)^2;
        else
            continue
        end
    end
end

if m0>=2
    S=zeros(1,m0);
    for j=1:m0
        for i=1:n-1
            if x0(j)>=x(i)&&x0(j)<=x(i+1)
                h=x(i+1)-x(i);
                S(j)=y(i)*(1+2*(x0(j)-x(i))/h)*((x0(j)-x(i+1))/h)^2+...
                      y(i+1)*(1+2*(x(i+1)-x0(j))/h)*((x0(j)-x(i))/h)^2+...
                      m(i)*(x0(j)-x(i))*((x0(j)-x(i+1))/h)^2+...
                      m(i+1)*(x0(j)-x(i+1))*((x0(j)-x(i))/h)^2;
            else
                continue
            end
        end
    end
end
end