function [x]=getx_Remez(a,b,n)
x=zeros(n+1,1);
for k=0:n
    x(k+1)=(b+a+(b-a)*cos((n-k)/n*pi))/2;
end
end