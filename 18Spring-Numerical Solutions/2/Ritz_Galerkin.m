function u=Ritz_Galerkin(PHI,f)
% �����������������ٻ�26ҳ���°棩����Ritz-Galerkin���⡣
% ���Ͻⷨ�ĵ��÷�ʽ��
% syms x;
% PHI=sym('[x*(1-x),x^2*(1-x)]');
% f=-x;
% Ritz_Galerkin(PHI,f)
% �õ����ϵĽ����
% ans =
% - (7*x^2*(x - 1))/41 - (71*x*(x - 1))/369
% ��Ȼ���������ø���ά�ıƽ��ռ䣬������ά����PHI�����
% PHI=sym('[x*(1-x),x^2*(1-x),x^3*(1-x)]');
% �ٵ��ã������ˡ�
l_p=length(PHI); % �õ���������ά��,�Զ������ά��.
for i=1:l_p
    for j=1:l_p
        auv=-diff(PHI(i))*diff(PHI(j))+PHI(i)*PHI(j); %�����ʽ.
        AUV=int(auv);         % �Ա����ʽ���Ż���.
        AUV=inline(AUV);      % �ѷ��ź���ת��Ϊ��ֵ�������ܼ�����ֵ.�������취��?
        A(i,j)=AUV(1)-AUV(0); % �����0��1�Ļ���ֵ.AUV�ǻ��ֵõ���ԭ����.
    end
    auv=-diff(PHI(i))*diff(f)+PHI(i)*f; %�������вμ�����ע��.
    AUV=int(auv);
    AUV=inline(AUV);
    B(i)=AUV(1)-AUV(0);
end
B=B';
A=sym(A);B=sym(B); % ԭ���ĳ���û�������У���������ֵ���㣬���Ƿ���,������.
C=A\B;             % matlab�������̽ⷨ.
u=PHI*C;           % �����÷��ű�ʾ΢�ַ��̵Ľ�.