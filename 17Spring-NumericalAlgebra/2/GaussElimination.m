clear
clc
A=input('����ϵ������A��');
b=input('����b������������������');
B=[A b']; 
n=length(b);
RA=rank(A);
RB=rank(B);
zhica=RB-RA;
if zhica>0,
    disp('��ע�⣺��ΪRA~=RB�����Դ˷������޽�.\n')
    return
end

if RA==RB
    if RA==n
        fprintf('��ע�⣺��ΪRA=RB=%d�����Դ˷�������Ψһ��.\n',n)
        X=zeros(n,1);
        for p=1:n-1
              t=find(abs(B(p:end,p))==max(abs(B(p:end,p))))+p-1;
              if abs(B(t,p))~=abs(B(p,p))
                    l=B(t,:);
                    B(t,:)=B(p,:);
                    B(p,:)=l;
              end  %����Ԫ�ж�
            
              for k=p+1:n     
                    m= B(k,p)/ B(p,p);
                    B(k,p:n+1)= B(k,p:n+1)-m* B(p,p:n+1);
                    B
              end
        end
        %�ѷ�����ϵ������A��Ϊͬ��������Ǿ���
        
        b=B(1:n,n+1);
        A=B(1:n,1:n); 
        X(n)=b(n)/A(n,n);
        for q=n-1:-1:1
            X(q)=(b(q)-sum(A(q,q+1:n)*X(q+1:n)))/A(q,q);
        end
        %��xn��x1�����������Ƿ�����
       
    else
        disp('��ע�⣺��ΪRA=RB<n�����Դ˷�������������.')
        return
    end
end
 
disp('������Ľ�Ϊ��');X