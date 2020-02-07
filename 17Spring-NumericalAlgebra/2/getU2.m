function [L,U,P]=getU2(A)
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
        for i=k:n
            t=A(k,i);
            A(k,i)=A(r,i);
            A(r,i)=t;
        end
        s=P(k,1:n);
        P(k,1:n)=P(r,1:n);
        P(r,1:n)=s;
    end
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
    end
    E=P*E;
end
U=triu(A);
L=eye(n)+tril(A,-1);
P=E;