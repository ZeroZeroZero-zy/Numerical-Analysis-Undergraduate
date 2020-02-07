function [a,b]=Fourier4_2(f,m,n,theta)
u=zeros(2*m+2,1);
a=zeros(n+1,1);
b=zeros(n+1,1);

if n<m
    for k=0:n
        sum1=0;
        for j=0:2*m
            sum1=sum1+f(j+1)*cos(j*k*theta);
        end
        a(k+1)=2*sum1/(2*m+1);
        sum2=0;
        for j=0:2*m
            sum2=sum2+f(j+1)*sin(j*k*theta);
        end
        b(k+1)=2*sum2/(2*m+1);
    end
end

if n==m
    u(2*m+2)=0;
    u(2*m+1)=0;
    for k=0:n
        for j=2*m:-1:1
            u(j)=f(j)+2*u(j+1)*cos(k*theta)-u(j+2);
        end
        a(k+1)=2*(f(1)+u(1)*cos(k*theta)-u(2))/(2*m+1);
        b(k+1)=2*u(1)*sin(k*theta)/(2*m+1);
    end
    b=b(2:n+1);
end
end