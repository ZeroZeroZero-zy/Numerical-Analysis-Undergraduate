function [y]=EulerBack(f,y0,a,b,h)
n=(b-a)/h+1;
x=a*ones(n,1);
y=zeros(n,1);
y(1)=y0;
for i=1:n
    x(i)=x(i)+(i-1)*h;
end
for i=1:n-1
    y1=y(i)+h*f(x(i+1),y(i));
    y2=y(i)+h*f(x(i+1),y1);
    while(norm(y1-y2)>1e-6)
        y1=y2;
        y2=y(i)+h*f(x(i+1),y2);
    end
    y(i+1)=y2;
end
end