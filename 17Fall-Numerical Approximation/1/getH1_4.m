function [H]=getH1_4(x,y,y_1,x0)
n=size(x,2);
m=length(x0);

if m==1
    H=0;
    for i=1:n-1
        if x0>=x(i)&&x0<=x(i+1)
            h=x(i+1)-x(i);
            H=y(i)*(1+2*(x0-x(i))/h)*((x0-x(i+1))/h)^2+...
                y(i+1)*(1-2*(x0-x(i+1))/h)*((x0-x(i))/h)^2+...
                y_1(i)*(x0-x(i))*((x0-x(i+1))/h)^2+...
                y_1(i+1)*(x0-x(i+1))*((x0-x(i))/h)^2;
        else
            continue
        end
    end
end

if m>=2
    H=zeros(1,m);
    for j=1:m
        for i=1:n-1
            if x0(j)>=x(i)&&x0(j)<=x(i+1)
                h=x(i+1)-x(i);
                H(j)=y(i)*(1+2*(x0(j)-x(i))/h)*((x0(j)-x(i+1))/h)^2+...
                    y(i+1)*(1-2*(x0(j)-x(i+1))/h)*((x0(j)-x(i))/h)^2+...
                    y_1(i)*(x0(j)-x(i))*((x0(j)-x(i+1))/h)^2+...
                    y_1(i+1)*(x0(j)-x(i+1))*((x0(j)-x(i))/h)^2;
            else
                continue
            end
        end
    end
end
end