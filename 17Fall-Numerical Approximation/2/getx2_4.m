function [x1]=getx2_4(x)
n=length(x);
x1=zeros(1,n-1);
for i=1:n-1
    x1(i)=(x(i+1)+x(i))/2;
end
end