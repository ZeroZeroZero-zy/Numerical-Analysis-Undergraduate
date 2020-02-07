function [x]=QRsolve1_1(Q,R,b)
n=size(Q,1);
x=zeros(n,1);
c=Q'*b;
for k=n:-1:1
    x(k)=(c(k)-R(k,k+1:n)*x(k+1:n))/R(k,k);
end