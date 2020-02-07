clc
clear

x=[1.3 1.31 1.32 1.33];
y=[3.6021 3.7471 3.9033 4.0723];
x1=1.305;
x2=1.325;
f1=NewtonForward(x,y,x1);
f2=NewtonBack(x,y,x2);
disp('已给数据：')
fprintf(' x   %5.2f  %5.2f  %5.2f  %5.2f\n',x(1),x(2),x(3),x(4))
fprintf('f(x) %5.4f %5.4f %5.4f %5.4f\n\n',y(1),y(2),y(3),y(4))
disp('使用Newton向前插值得到的结果为：')
fprintf('f(1.305)=%.5f\n',f1)
disp('使用Newton向后插值得到的结果为：')
fprintf('f(1.325)=%.5f\n',f2)