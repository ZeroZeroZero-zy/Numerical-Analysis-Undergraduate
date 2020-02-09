function [y,z]=EulerForward1_4(f,y0,z0,a,b,h)
N=(b-a)/h;
x=a:h:b;
y=zeros(N+1,1);
z=zeros(N+1,1);
y(1)=y0; 
z(1)=z0;
for n=0:N-1
    y(n+2)=y(n+1)+h*z(n+1);
    z(n+2)=z(n+1)+h*f(x(n+1),y(n+1),z(n+1));
end
end