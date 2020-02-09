clc
clear

f=1;
h_r=1/(32+0.5);
h_theta=2*pi/32;
I=32; J=32;
kc=5.613;

r=((0:32)+0.5)*h_r;
theta=(1:J)*h_theta;
U=zeros(J,I+1);
U(:,I+1)=0;
U(:,1:I)=sum(U(:,I+1))/(I+1);

for n=1:1e6
    
    for j=0:J-1
        if j==0
            U(1,1) = (h_r^2*h_theta^2/(8+2*h_theta^2)) * ( (2/h_r^2)*U(1,2) + (4/(h_r^2*h_theta^2))*U(2,1) ...
                                               + (4/(h_r^2*h_theta^2))*U(J,1) - kc^2*U(1,1) + f );
        elseif j==J-1
            U(j+1,1) = (h_r^2*h_theta^2/(8+2*h_theta^2)) * ( (2/h_r^2)*U(j+1,2) + (4/(h_r^2*h_theta^2))*U(1,1) ...
                                               + (4/(h_r^2*h_theta^2))*U(j,1) - kc^2*U(j+1,1) + f );
        else
            U(j+1,1) = (h_r^2*h_theta^2/(8+2*h_theta^2)) * ( (2/h_r^2)*U(j+1,2) + (4/(h_r^2*h_theta^2))*U(j+2,1) ...
                                               + (4/(h_r^2*h_theta^2))*U(j,1) - kc^2*U(j+1,1) + f );
        end
    end
    
    for i=1:I-1
        for j=0:J-1
            if i~=I
                r1=(r(i+1)+r(i+2))/2; r2=(r(i)+r(i+1))/2;
            else
                r1=r(i+1); r2=r(i);
            end
            a=(r1+r2)/(r(i+1)*h_r^2); b=2/(r(i+1)*h_theta)^2;
            if j==0
                U(j+1,i+1) = (1/(a+b)) * ( (r1/(r(i+1)*h_r^2))*U(j+1,i+2) + (r2/(r(i+1)*h_r^2))*U(j+1,i) ...
                                 + (1/(r(i+1)*h_theta)^2)*U(j+2,i+1) + (1/(r(i+1)*h_theta)^2)*U(J,i+1) ...
                                 - kc^2*U(j+1,i+1) + f );
            elseif j==J-1
                U(j+1,i+1) = (1/(a+b)) * ( (r1/(r(i+1)*h_r^2))*U(j+1,i+2) + (r2/(r(i+1)*h_r^2))*U(j+1,i) ...
                                 + (1/(r(i+1)*h_theta)^2)*U(1,i+1) + (1/(r(i+1)*h_theta)^2)*U(j,i+1) ...
                                 - kc^2*U(j+1,i+1) + f );
            else
                U(j+1,i+1) = (1/(a+b)) * ( (r1/(r(i+1)*h_r^2))*U(j+1,i+2) + (r2/(r(i+1)*h_r^2))*U(j+1,i) ...
                                 + (1/(r(i+1)*h_theta)^2)*U(j+2,i+1) + (1/(r(i+1)*h_theta)^2)*U(j,i+1) ...
                                 - kc^2*U(j+1,i+1) + f );
            end
        end
    end
    
    if n > 1 && max(max(abs(U - U0))) < 1e-6  %循环结束条件
        break; 
    end
    U0=U;
end
U=rot90(U,3);
X=r'*cos(theta);
Y=r'*sin(theta);
figure('Name','4-4')
surf(X,Y,U);
shading interp;
title('极坐标差分格式')