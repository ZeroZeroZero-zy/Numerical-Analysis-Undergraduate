function [I]=getIn0_4_2(n,I1)
I=I1;
for i=n:-1:0
    I=(1-I)/i;
end