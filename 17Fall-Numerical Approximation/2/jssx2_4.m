clc
clear

%求解
x=[0.25 0.3 0.39 0.45 0.53];
y=[0.5 0.5477 0.6245 0.6708 0.728];
y0_1=1;
yN_1=0.6868;
[A,d]=getAd2_4(x,y,y0_1,yN_1);
m=LUsolve2_3(A,d); %使用追赶法解方程组
m1=getM2_1(A,d);
disp('对比两种方法得到的m')
disp('      m         m1')
disp([m m1])  %对比两种方法得到的m
x1=0.25:0.001:0.53;
y1=getS2_4(x,y,m,x1);
x2=getx2_4(x);
y2=getS2_4(x,y,m,x2);
y3=spline(x,y,x2);
y4=spline(x,y,x1);

%结果
disp('已给数据：')
fprintf(' x    %5.4f     %5.4f     %5.4f     %5.4f     %5.4f\n',x(1),x(2),x(3),x(4),x(5))
fprintf('f(x)  %5.4f     %5.4f     %5.4f     %5.4f     %5.4f\n\n',y(1),y(2),y(3),y(4),y(5))
disp('每段中点及近似值：')
fprintf(' x    %5.4f     %5.4f     %5.4f     %5.4f\n',x2(1),x2(2),x2(3),x2(4))
fprintf('s(x)  %5.4f     %5.4f     %5.4f     %5.4f\n',y2(1),y2(2),y2(3),y2(4))
fprintf('s1(x) %5.4f     %5.4f     %5.4f     %5.4f\n\n',y3(1),y3(2),y3(3),y3(4))

%画图
figure('Name','7_4')
plot(x,y,'o',x1,y1,'-r',x2,y2,'b+')
hold on
plot(x1,y4,':k')
legend('插值结点','三次样条插值函数图形','结点中点','spline验证')
title('三次样条插值函数图形')