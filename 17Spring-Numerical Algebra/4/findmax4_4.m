function [a]=findmax4_4(A)
n=size(A,1);
a=0;
A=abs(A);
for i=1:n
    for j=1:n
        if A(i,j)>=a
            a=A(i,j);
        end
    end
end