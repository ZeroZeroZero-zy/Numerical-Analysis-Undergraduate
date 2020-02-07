function [B]=tentotwo0_3(A)
A1=fix(A);
k=1;
r=zeros(1,1);
while A1>=2
    r(1,k)=mod(A1,2);
    A1=fix(A1/2);
    k=k+1;
end
r(1,k)=A1;
r=fliplr(r);
b=num2str(r);
B=strrep(b,' ','');
end