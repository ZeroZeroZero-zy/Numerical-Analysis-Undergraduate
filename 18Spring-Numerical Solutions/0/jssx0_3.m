clc
clear
close all

f=@(x)sin(x)./(1.+x);
a=0;
b=2;
eps=1e-6;

m=1;
I=Composite_Gauss(f,a,b,m);
I0=I;
m=m+1;
I=Composite_Gauss(f,a,b,m);
while(norm(I-I0)>eps)
    I0=I;
    m=m+1;
    I=Composite_Gauss(f,a,b,m);
end

I1=quadgk(f,a,b,'RelTol',1e-8,'AbsTol',1e-12);
fprintf('迭代结束时积分值为：%d\n',I)
fprintf('Matlab积分值为：%d\n',I1)