function [x,k]=Polynomial_Newton(f,x0,eps,N)
a=sym2poly(f);
n=size(a,2);
b=zeros(1,n+1);
c=zeros(1,n);
x=x0;
for i=1:n
    b(i+1)=a(i)+x*b(i);    
end
for j=1:n-1
    c(j+1)=b(j+1)+x*c(j);
end
x1=x;
x=x-b(n+1)/c(n);
k=1;
while norm(x-x1)>=eps
    for i=1:n
        b(i+1)=a(i)+x*b(i);    
    end
    for j=1:n-1
        c(j+1)=b(j+1)+x*c(j);
    end
    x1=x;
    x=x-b(n+1)/c(n);
    k=k+1;
    if k>=N
        return
    end
end
end