for t=1:n
    U(1:t,t)=A(1:t,t);
end
for t=2:n
    L(t,1:t-1)=A(t,1:t-1);
end

A=[2 4 -2;1 -1 5;4 1 -2];
A(1,:).*B(:,1)=1;
A(1,:).*B(:,2)=0;
A(1,:).*B(:,3)=0;
A(2,:).*B(:,1)=0;
A(2,:).*B(:,2)=1;
A(2,:).*B(:,3)=0;
A(3,:).*B(:,1)=0;
A(3,:).*B(:,2)=0;
A(3,:).*B(:,3)=1;
A

A1=[2 4 -2;1 -1 5;4 1 -2];
A2=[3 1 0;9 3 1;0 9 3];
A3=[1 2 1 -2;2 5 3 -2;-2 -2 3 5;1 3 2 3];

U=[2 4 -2;0 -3 6;0 0 -12];
D=[1/2 -2/3 -1/4;0 -1/3 -2/3;0 0 -1/12];
CL