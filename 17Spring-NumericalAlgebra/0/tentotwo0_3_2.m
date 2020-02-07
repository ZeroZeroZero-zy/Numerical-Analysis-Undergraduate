function [C]=tentotwo0_3_2(A)
format long
t=1;
g=zeros(1,1);
b=zeros(1,1);
while A~=0
    g(1,t)=fix(A*2); 
    b(1,t)=A;
    A=A*2-fix(A*2);
    t=t+1;
    if t>1000
        break
    end
end
c=num2str(g);
C=strrep(c,' ','');
format short
end