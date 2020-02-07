function [x,y,y_1]=getxyy1_4(n,a,b,f,g)
x=zeros(1,n+1);
for i=1:n+1
    x(i)=a+(i-1)*norm(a-b)/n;
end
y=f(x);
y_1=g(x);
end