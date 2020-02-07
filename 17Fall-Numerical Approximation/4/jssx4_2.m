clc
clear

f=@(x)x.^2;
n=50;
m=50;
theta=2*pi/(2*n+1);
x=zeros(2*n+1,1);
for j=0:100
    x(j+1)=j*theta;
end
fx=f(x);
[a,b]=Fourier4_2(fx,m,n,theta);

%结果
disp('a=')
for i=1:5
    for j=1:10
        fprintf('%7.4f  ',a(10*(i-1)+j))
    end
    fprintf('\n')
end
fprintf('%7.4f  \n\n',a(n+1))
disp('b=')
for i=1:5
    for j=1:10
        fprintf('%7.4f  ',b(10*(i-1)+j))
    end
    fprintf('\n')
end

%画图
syms t
s=a(1)/2;
for k=1:n
    s=s+a(k+1)*cos(k*t)+b(k)*sin(k*t);
end
s=matlabFunction(s);
figure('Name','4_2')
fplot(s,[0 2*pi],'-r')
hold on
fplot(f,[0 2*pi],'-k')
legend('最小二乘三角函数逼近图像','f(x)')
title('最小二乘三角函数逼近图像与f(x)=x^2图像对比')