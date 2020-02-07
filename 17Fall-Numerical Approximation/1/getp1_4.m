function [p]=getp1_4(x,y,x0)
n=size(x,2);
m=length(x0);

if m==1
    p=0;
    for i=1:n-1
        if x0>=x(i)&&x0<=x(i+1)
            p=y(i)*(x0-x(i+1))/(x(i)-x(i+1))+...
                y(i+1)*(x0-x(i))/(x(i+1)-x(i));
        else
            continue

        end
    end
end

if m>=2
    p=zeros(1,m);
    for j=1:m
        for i=1:n-1
            if x0(j)>=x(i)&&x0(j)<=x(i+1)
                p(j)=y(i)*(x0(j)-x(i+1))/(x(i)-x(i+1))+...
                    y(i+1)*(x0(j)-x(i))/(x(i+1)-x(i));
            else
                continue
            end
        end
    end
end
end