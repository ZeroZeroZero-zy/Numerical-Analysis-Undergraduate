function [L,U,P]=getU(A)
n=size(A,1);
L=eye(n);
E=eye(n);
for k=1:n-1
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
    for i=k+1:n
        L(i,k)=A(i,k)/A(k,k);
        A(i,:)=A(i,:)-L(i,k)*A(k,:);
    end
    E=P*E;
    L=P*L;
end
U=A;
P=E;
