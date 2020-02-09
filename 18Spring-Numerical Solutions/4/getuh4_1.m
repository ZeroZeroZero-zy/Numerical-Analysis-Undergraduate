function [uh]=getuh4_1(u,a,b,x1)
%µÈ·Ö
n=length(u)-1;
h=(b-a)/n;
x=a:h:b;
m=length(x1);
 
if m==1
    for i=1:n
        if x1>=x(i) && x1<=x(i+1)
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
                uh(j)=(x(i+1)-x1(j))*u(i)/h+(x1(j)-x(i))*u(i+1)/h;
                break
            else
                continue
            end
        end
    end
end