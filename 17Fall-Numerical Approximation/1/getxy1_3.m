function [x,y]=getxy1_3(n,a,b,f)
x=zeros(1,n+1);
for i=1:n+1
    x(i)=a+(i-1)*norm(a-b)/n;
end
y=f(x);
end