function [U,b]=getUb2_3(A,b)
n=size(A,1);
for k=1:n-1
    r=k;
    a=norm(A(k,k));
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
        s=b(k);
        b(k)=b(r);
        b(r)=s;
    end
    for i=k+1:n
        b(i)=b(i)-(A(i,k)/A(k,k))*b(k);
        A(i,:)=A(i,:)-(A(i,k)/A(k,k))*A(k,:); 
    end
end
U=A;