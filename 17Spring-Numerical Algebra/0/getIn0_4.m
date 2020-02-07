function [I]=getIn0_4(n,I0)
I=I0;
for i=1:n
    I=1-i*I;
end