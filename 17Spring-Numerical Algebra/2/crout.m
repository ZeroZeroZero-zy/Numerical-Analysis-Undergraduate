function [L,U]=crout(A)
b=size(A);
    %b(1)行
    %b(2)列
    n=b(1);%这里只处理n*n的非奇异矩阵
    %错误检查
     if b(1)~=b(2)%非方阵错误
        error('MATLAB:Crout:Input Matrix should be a Square matrix.  See Crout.');
    end
    if n~=rank(A)%非满秩矩阵错误
        error('MATLAB:Crout:Input Matrix should be FULL RANK.  See Crout.');
    end    
   
    %初始化
L=zeros(n,n);
    U=zeros(n,n);   
    %U中的主对角线元素均为1
    for i=1:n
        U(i,i)=1;
    end
    %开始计算
    for k=1:n
        
        for i=k:n %L中计算的方式是行为外循环，列为内循环
            t=0; %临时和
            for t=1:k-1
                t=t+L(i,t)*U(t,k);
            end
            L(i,k)=A(i,k)-t; %计算L的第k列元素
        end
        
        for j=k+1:n %U中计算的方式是列为外循环，行为内循环
            t=0; %临时和
            for t=1:k-1
                t=t+L(k,t)*U(t,j); 
            end
            U(k,j)=(A(k,j)-t)/L(k,k);%计算U的第k行元素
        end
    end
end %end of function