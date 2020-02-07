function [Q,R]=qrhs1(A)
n=size(A,1);
R=A;
Q=eye(n);
for i=1:n-1
    x=R(i:n,i);
    y=[1;zeros(n-i,1)];
    x=x(:);
    y=y(:);
    if length(x)~=length(y)
    error('The Column Vectors X and Y Must Have The Same Length!');
    end
    rho=-sign(x(1))*norm(x);
    y=rho*y;
    v=(x-y)/norm(x-y);
    I=eye(length(x));
    Ht=I-2*v*v';
    H=blkdiag(eye(i-1),Ht);
    Q=Q*H;
    R=H*R;
end