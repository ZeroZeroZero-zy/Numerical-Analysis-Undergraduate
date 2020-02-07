function [Q,R,x]=QR43(A,b)
n=length(A);
Q=eye(n);
R=A;
for i=1:n-1
    x=R(i:n,i);
    if all(x(2:n-i+1)~=0)
       x=x/norm(x,inf);
       delta=norm(x,2)*sign(x(1));
       v=[x(1)+delta;
       x(2:n-i+1)];
       beta=2/norm(v,2)^2;
    else
       beta=0;
       v=0;
    end
    h=eye(n-i+1)-beta*v*v';
    H=blkdiag(eye(i-1),h);
    Q=Q*H;
    R=H*R;
end
R=triu(R);
y=Q'*b;
for i=n:-1:1
    x(i)=(y(i)-R(i,i+1:n)*x(i+1:n))/R(i,i);
end