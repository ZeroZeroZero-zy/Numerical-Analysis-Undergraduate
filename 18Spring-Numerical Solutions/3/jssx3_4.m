clc
clear
close all

%�����ڵ�
x=0:pi/8:pi;
l=length(x);
x=0:pi/8:pi;
N=zeros(l*l,2);
N(1:l,1)=x';
N(l+1:2*l-1,1)=pi;N(l+1:2*l-1,2)=x(2:l)';
N(2*l:3*l-2,1)=x(l-1:-1:1)';N(2*l:3*l-2,2)=pi;
N(3*l-1:4*l-4,2)=x(l-1:-1:2)';
for i=2:l-1
    N(4*l-3+(i-2)*(l-2):5*l-6+(i-2)*(l-2),1)=x(2:l-1)';
    N(4*l-3+(i-2)*(l-2):5*l-6+(i-2)*(l-2),2)=x(l-i+1);
end

%�����ڵ�
N_b = 4*(l-1); %��Ե�ڵ��� 
%�ָ�����
S=delaunay(N); %������

f=@(x,y)-(2+pi*x-x.^2).*sin(y); 
g=@(x,y)0;

N_n = size(N,1); %�ܽڵ���
N_i = N_n - N_b; %�ڲ��ڵ���
c = zeros(1,N_n); %�߽�ڵ���ڲ��ڵ��ȡֵ
p = fem_basis_ftn(N,S);
[U,c] = fem_coef(f,g,p,c,N,S,N_i);
%���ͼ��
figure(1), clf, trimesh(S,N(:,1),N(:,2),c)
N_s = size(S,1); %����������
x0 = 0; xf = pi; y0 = 0; yf = pi;
Mx = 16; dx = (xf - x0)/Mx; xi = x0+[0:Mx]*dx;
My = 16; dy = (yf - y0)/My; yi = y0+[0:My]*dy;
for i = 1:length(xi)
    for j = 1:length(yi)
        for s = 1:N_s %�õ����ڸ�����
            if inpolygon(xi(i),yi(j), N(S(s,:),1),N(S(s,:),2)) > 0
                Z(i,j) = U(s,:)*[1 xi(i) yi(j)]';
                break;
            end
        end
    end
end
figure(2), clf, mesh(xi,yi,Z)