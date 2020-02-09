function [uh]=getu3_2(u,x,x1)
n=length(x)-1;
m=length(x1);
 
if m==1
    for i=1:n
        if x1>=x(i) && x1<=x(i+1)
            h=x(i+1)-x(i);
            uh=(x(i+1)-x1)*u(i)/h+(x1-x(i))*u(i+1)/h;
            break
        else
            continue
        end
    end
end

if m~=1
    uh=zeros(m,1);
    for j=1:m
        for i=1:n
            if x1(j)>=x(i) && x1(j)<=x(i+1)
                h=x(i+1)-x(i);
                uh(j)=(x(i+1)-x1(j))*u(i)/h+(x1(j)-x(i))*u(i+1)/h;
                break
            else
                continue
            end
        end
    end
end