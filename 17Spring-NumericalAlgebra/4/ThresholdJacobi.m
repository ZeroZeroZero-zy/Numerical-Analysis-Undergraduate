function [V,D,k]=ThresholdJacobi(A,eps,sigma)
n=size(A,1);
k=0;
V=eye(n);
B=A-diag(diag(A));
alpha=sum(sum(B.^2))/sigma;
while alpha>=eps
    k=k+1;
    C=tril(abs(A),-1);
    [p,q]=find(C>alpha);
    m=size(p,1);
    for t=1:m
        p1=p(t);
        q1=q(t);
        if A(p1,p1)==A(q1,q1)
            c=sqrt(2)/2;
            s=sqrt(2)/2;
        else
            x=2*A(p1,q1)*sign(A(q1,q1)-A(p1,p1));
            y=abs(A(p1,p1)-A(q1,q1));
            c=sqrt((1+y/sqrt(x^2+y^2))/2);
            s=x/(2*c*sqrt(x^2+y^2));
        end
        R=eye(n);
        R(p1,p1)=c;
        R(p1,q1)=s;
        R(q1,p1)=-s;
        R(q1,q1)=c;
        A=R'*A*R;
        V=V*R;
    end
    alpha=alpha/sigma;
end
D=A;
end