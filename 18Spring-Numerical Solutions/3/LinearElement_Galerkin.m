function [uh]=LinearElement_Galerkin(f,p,q,a,b,n,x1)
syms x;
h=(b-a)/n;
x0=a:h:b;
A=zeros(n);
d=zeros(n,1);
for j=2:n-1
    int1=-p*h^-2+q*(x-x0(j))*(x0(j+1)-x)/h^2;
    int2=p*h^-2+q*((x-x0(j))/h)^2;
    int3=p*h^-2+q*((x0(j+2)-x)/h)^2;
    int4=-p*h^-2+q*(x0(j+2)-x)*(x-x0(j+1))/h^2;
    A(j,j-1)=quadgk(matlabFunction(int1),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12);
    A(j,j)=quadgk(matlabFunction(int2),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12)+...
             quadgk(matlabFunction(int3),x0(j+1),x0(j+2),'RelTol',1e-8,'AbsTol',1e-12);
    A(j,j+1)=quadgk(matlabFunction(int4),x0(j+1),x0(j+2),'RelTol',1e-8,'AbsTol',1e-12);
    
    int5=f*(x-x0(j))/h;
    int6=f*(x0(j+2)-x)/h;
    d(j)=quadgk(matlabFunction(int5),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12)+...
         quadgk(matlabFunction(int6),x0(j+1),x0(j+2),'RelTol',1e-8,'AbsTol',1e-12);
end
j=1;
int2=p*h^-2+q*((x-x0(j))/h)^2;
int3=p*h^-2+q*((x0(j+2)-x)/h)^2;
int4=-p*h^-2+q*(x0(j+2)-x)*(x-x0(j+1))/h^2;
A(j,j)=quadgk(matlabFunction(int2),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12)+...
       quadgk(matlabFunction(int3),x0(j+1),x0(j+2),'RelTol',1e-8,'AbsTol',1e-12);
A(j,j+1)=quadgk(matlabFunction(int4),x0(j+1),x0(j+2),'RelTol',1e-8,'AbsTol',1e-12);

int5=f*(x-x0(j))/h;
int6=f*(x0(j+2)-x)/h;
d(j)=quadgk(matlabFunction(int5),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12)+...
     quadgk(matlabFunction(int6),x0(j+1),x0(j+2),'RelTol',1e-8,'AbsTol',1e-12);
     
j=n;
int1=-p*h^-2+q*(x-x0(j))*(x0(j+1)-x)/h^2;
int2=p*h^-2+q*((x-x0(j))/h)^2;
A(j,j-1)=quadgk(matlabFunction(int1),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12);
A(j,j)=quadgk(matlabFunction(int2),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12);
   
int5=f*(x-x0(j))/h;
d(j)=quadgk(matlabFunction(int5),x0(j),x0(j+1),'RelTol',1e-8,'AbsTol',1e-12);
 
u=A\d;
 
m=length(x1);
 
if m==1
    if x1>=x0(1)&&x1<=x0(2)
        uh=u(1)*(x1-x0(1))/h;
    else
        for i=1:n-1
            if x1>=x0(i+1)&&x1<=x0(i+2)
                uh=u(i)*(x0(i+2)-x1)/h+u(i+1)*(x1-x0(i+1))/h;
                break
            else
                continue
            end
        end
    end
end

if m~=1
    uh=zeros(m,1);
    for j=1:m
        if x1(j)>=x0(1)&&x1(j)<=x0(2)
            uh(j)=u(1)*(x1(j)-x0(1))/h;
        else
            for i=1:n-1
                if x1(j)>=x0(i+1)&&x1(j)<=x0(i+2)
                    uh(j)=u(i)*(x0(i+2)-x1(j))/h+u(i+1)*(x1(j)-x0(i+1))/h;
                    break
                else
                    continue
                end
            end
        end
    end
end

end