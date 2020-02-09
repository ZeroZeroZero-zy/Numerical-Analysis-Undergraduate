function [U,B]=getUB4_3(f,N,x0,y0)
h=pi/N;
x=0:h:pi;
y=0:h:pi;
U=zeros(N+1,N+1);
U(:,[1 N+1])=0;
U([1 N+1],:)=0;

for n = 1:1e6
    for i = 1:N-1
        for j = 1:N-1
            U(j+1,i+1) = ( U(j+1,i) + U(j,i+1) + U(j+1,i+2) ...
                      + U(j+2,i+1) + h^2*f(x(i+1),y(j+1)) )/4;
        end
    end
    if n > 1 && max(max(abs(U - U0))) < 1e-6  %循环结束条件
        break; 
    end
    U0 = U;
end
%U=flipud(U);
B=zeros(3);
for i=1:3
    for j=1:3
        B(j,i)=U(y0(j)/h+1,x0(i)/h+1);
    end
end
%B=flipud(B); %将B翻转为按坐标系的格式
end