fprintf('  k           x1           x2            x3\n');
for i=0:k
    [x]=GaussSeidel(A,b,x0,i);
    fprintf('%3d %12d %12d %12d\n',i,x(1,1),x(2,1),x(3,1));
end
