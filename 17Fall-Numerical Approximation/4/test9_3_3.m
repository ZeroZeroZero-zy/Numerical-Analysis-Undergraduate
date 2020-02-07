k=4;
n=2^k;
pr1=zeros(1,n);
for i=0:n-1
    pr1(i+1)=i;
end
fr=zeros(1,n);
for i=0:n-1
    m=i;
    is=0;
    for ii=0:k-1
        j=fix(m/2);
        is=2*is+(m-2*j);
        m=j;
    end
    fr(i+1)=pr1(is+1);
end