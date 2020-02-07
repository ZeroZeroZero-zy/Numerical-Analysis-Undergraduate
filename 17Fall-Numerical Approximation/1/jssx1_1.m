clc
clear

x=[0.46 0.47 0.48 0.49];
y=[0.4846555 0.4937452 0.5027498 0.5116683];
x0=0.485;
f_l=Lagrange_Interpolation(x,y,x0);
f_n=Newton_Interpolation(x,y,x0);
disp('�Ѹ����ݣ�')
fprintf(' x     %5.2f     %5.2f     %5.2f     %5.2f\n',x(1),x(2),x(3),x(4))
fprintf('f(x) %.7f %.7f %.7f %.7f\n\n',y(1),y(2),y(3),y(4))
disp('ʹ��Lagrange��ֵ�õ��Ľ��Ϊ��')
fprintf('f(0.485)=%.8f\n',f_l)
disp('ʹ��Newton��ֵ�õ��Ľ��Ϊ��')
fprintf('f(0.485)=%.8f\n',f_n)
disp('ʹ��interp1�õ��Ľ��Ϊ��')
fprintf('f(0.485)=%.8f\n',interp1(x,y,x0))