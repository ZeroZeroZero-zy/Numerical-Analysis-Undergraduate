function [L,U]=crout(A)
b=size(A);
    %b(1)��
    %b(2)��
    n=b(1);%����ֻ����n*n�ķ��������
    %������
     if b(1)~=b(2)%�Ƿ������
        error('MATLAB:Crout:Input Matrix should be a Square matrix.  See Crout.');
    end
    if n~=rank(A)%�����Ⱦ������
        error('MATLAB:Crout:Input Matrix should be FULL RANK.  See Crout.');
    end    
   
    %��ʼ��
L=zeros(n,n);
    U=zeros(n,n);   
    %U�е����Խ���Ԫ�ؾ�Ϊ1
    for i=1:n
        U(i,i)=1;
    end
    %��ʼ����
    for k=1:n
        
        for i=k:n %L�м���ķ�ʽ����Ϊ��ѭ������Ϊ��ѭ��
            t=0; %��ʱ��
            for t=1:k-1
                t=t+L(i,t)*U(t,k);
            end
            L(i,k)=A(i,k)-t; %����L�ĵ�k��Ԫ��
        end
        
        for j=k+1:n %U�м���ķ�ʽ����Ϊ��ѭ������Ϊ��ѭ��
            t=0; %��ʱ��
            for t=1:k-1
                t=t+L(k,t)*U(t,j); 
            end
            U(k,j)=(A(k,j)-t)/L(k,k);%����U�ĵ�k��Ԫ��
        end
    end
end %end of function