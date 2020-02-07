function [x]=LUsolve2_3(A,b)
n=size(A,1);
x=zeros(n,1);
[U,b]=getUb2_3(A,b);
x(n)=b(n)/U(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum=sum+U(i,j)*x(j);
    end
    x(i)=(b(i)-sum)/U(i,i);
end
end