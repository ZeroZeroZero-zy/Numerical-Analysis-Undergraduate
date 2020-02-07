x0=[0;0;0];
fprintf('  k           x1           x2            x3\n');
for i=0:k
    [x]=Jacobi(A,b,x0,i);
    fprintf('%3d %12.6d %12.6d %12.6d\n',i,x(1,1),x(2,1),x(3,1));
end
