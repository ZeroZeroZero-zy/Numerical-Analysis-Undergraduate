function [ V,D ] = ClassicJacobi3( A,eps )
[n,n]=size(A);
k=0;
T=eye(n);
V=eye(n);
V=V*T;
E=A-diag(diag(A));
m = sum(sum(E.^2));
while m>=eps
    
    T=eye(n);
     C=tril(abs(A),-1);
     [p,q]=find(C==max(C(:)));
     x=2*A(p,q)*sign(A(q,q)-A(p,p));
     y=abs(A(p,p)-A(q,q));
     c=sqrt((1+y/sqrt(x^2+y^2))/2);
     s=x/(2*c*sqrt(x^2+y^2));
     T(p,p)=c;T(q,q)=c;
     T(p,q)=s;T(q,p)=-s;
     A=T'*A*T;
     V=V*T;
     E=A-diag(diag(A));
     m = sum(sum(E.^2));
     k=k+1;

end
D=A;
k
end