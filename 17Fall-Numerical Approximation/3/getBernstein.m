function [Bnf]=getBernstein(f,n)
syms t;
Bnf=0;
for k=0:n
    Bnf=Bnf+f(k/n)*nchoosek(n,k)*t^k*(1-t)^(n-k);
end
Bnf=simplify(Bnf);
end