function [G,Q]=Hessenberg(A)
n=size(A,1);
Q=eye(n);
for i=1:n-2
    B=A(i+1:n,1:i);
    a=B(:,i);
    if a(1)>=0
        s=1;
    else
        s=-1;
    end
    alpha=norm(a)*s;
    m=a+alpha*eye(n-i,1);
    H0=eye(n-i)-2*(m*m')/norm(m)^2;
    H=zeros(n);
    H(1:i,1:i)=eye(i);
    H(i+1:n,i+1:n)=H0;
    A=H*A*H;
    Q=Q*H;
end
G=A;
