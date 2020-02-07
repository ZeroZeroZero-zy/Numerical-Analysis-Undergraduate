function [Q,R]=QR4_3(A)
n=size(A,1);
[Q,R]=QR1_1(A);
for i=1:n
    if R(i,i)<0
        R(i,:)=-R(i,:);
        Q(:,i)=-Q(:,i);
    end
end