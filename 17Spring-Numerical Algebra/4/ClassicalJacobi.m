function [V,D,k]=ClassicalJacobi(A,eps)
n=size(A,1);
k=0;
A0=A-diag(diag(A));
V=eye(n);
while sum(sum(A0.^2))>=eps
    k=k+1;
    C=tril(abs(A),-1);
    [p,q]=find(C==max(C(:)));
    if A(p,p)==A(q,q)
        c=sqrt(2)/2;
        s=sqrt(2)/2;
    else
        x=2*A(p,q)*sign(A(q,q)-A(p,p));
        y=abs(A(p,p)-A(q,q));
        c=sqrt((1+y/sqrt(x^2+y^2))/2);
        s=x/(2*c*sqrt(x^2+y^2));
    end
    R=eye(n);
    R(p,p)=c;
    R(p,q)=s;
    R(q,p)=-s;
    R(q,q)=c;
    A=R'*A*R;
    A0=A-diag(diag(A));
    V=V*R;
end
D=A;
end