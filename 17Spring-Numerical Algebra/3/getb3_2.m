function [b]=getb3_2(N,h)
b=zeros(N-1,1);
for i=1:N-1
    f=4*pi^2*sin(2*pi*i*h);
    b(i)=h^2*f;
end