clc
clear
close all

f=@(x)4*sqrt(1+3*(sin(x)).^2);
a=0;
b=pi/2;

k=2;
A=zeros(k);
A(1,1)=Composite_Trapezium(f,a,b,1);
A(k,1)=Composite_Trapezium(f,a,b,2^(k-1));
A(k,k)=(4^(2-1)*A(k,k-1)-A(k-1,k-1))/(4^(2-1)-1);

while(norm(A(k,k)-A(k-1,k-1))>1e-6)
    k=k+1;
    A(k,k)=0;
    A(k,1)=Composite_Trapezium(f,a,b,2^(k-1));
    for i=2:k
        A(k,i)=(4^(i-1)*A(k,i-1)-A(k-1,i-1))/(4^(i-1)-1);
    end
    if k>=1e6
        break
    end
end

fprintf('迭代结束时主对角线元素即积分值：%.6d\n',A(k,k))
disp('Romberg求积序列')
disp(A)