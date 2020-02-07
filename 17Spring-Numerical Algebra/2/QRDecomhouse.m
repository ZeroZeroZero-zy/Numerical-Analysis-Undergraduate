function [Q,R] = QRDecomhouse(A)
[n,n]=size(A);
E=eye(n);
R=zeros(n);
P1=E;
for k=1:n-1      %ππ‘Ïw, πPk=I-2ww'      
    s=-sign(A(k,k))* norm(A(k:n,k));
    R(k,k)=-s;     
    if k==1         
        w=[A(1,1)+s,A(2:n,k)']';
    else
        w=[zeros(1,k-1),A(k,k)+s,A(k+1:n,k)']';
        R(1:k-1,k)=A(1:k-1,k);            
    end
    if norm(w)~=0         
        w=w/norm(w);     
    end
    P=E-2*w*w';
    A=P*A;    
    P1=P*P1;    
    R(1:n,n)=A(1:n,n);
end
Q=P1';
