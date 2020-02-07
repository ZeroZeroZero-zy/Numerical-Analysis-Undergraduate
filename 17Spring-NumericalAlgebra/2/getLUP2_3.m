function [L,U,P]=getLUP2_3(A)
n=size(A,1);
L=eye(n);
E=eye(n);
G=zeros(n,n,n);
G1=zeros(n,n,n);
X=zeros(n,n,n);
for k=1:n-1
    c=zeros(n,1);
    b=zeros(1,n);
    r=k;
    a=norm(A(k,k));
    P=eye(n);
    for i=k+1:n
        if a<norm(A(i,k))
            r=i;
            a=norm(A(i,k));
        end
    end
    if r~=k
        t=A(k,k:n);
        A(k,k:n)=A(r,k:n);
        A(r,k:n)=t;
        s=P(k,1:n);
        P(k,1:n)=P(r,1:n);
        P(r,1:n)=s;
    end
    c(k+1:n)=A(k+1:n,k);
    b(k)=1;
    G(:,:,k)=eye(n)-(1/A(k,k))*c*b;
    for i=k+1:n
        A(i,:)=A(i,:)-(A(i,k)/A(k,k))*A(k,:);
    end
    E=P*E;
    X(:,:,k)=P;
end
for i=1:n-1
    G1(:,:,i)=G(:,:,i);
    for k=i+1:n-1
        G1(:,:,i)=X(:,:,k)*G1(:,:,i)*X(:,:,k);
    end
end
U=A;
for i=1:n-1
    L=G1(:,:,i)*L;
end
L=ni(L);
P=E;