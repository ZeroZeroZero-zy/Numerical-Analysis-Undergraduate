function [L,U,B,d]=Doolittle(A)
[L,U]=LU2(A);
B=ni2(U)*ni(L);
d=det2(L)*det2(U);
end