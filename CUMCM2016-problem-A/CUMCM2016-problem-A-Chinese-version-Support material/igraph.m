function igraph()
% �����ڷ���v��ͬ������� ������,k��H�Ĺ�ϵ����ͼ

clc;
clear;
addpath(genpath(pwd));


v = 36;  % ����

x = 0:0.1:30;
y = 0:1:209;
[X, Y]=meshgrid(x,y);
[lx, ly] = size(X);
Z = zeros(lx, ly);
for i = 1:lx
    for j = 1:ly
        Z(i, j) = get_H(v, X(i,j), Y(i,j));
    end
end

% ��ͼ
figure;
% ����3d����ͼ H = f(v, ��, k) ����vΪ����
mesh(X,Y,Z);
hold on;
% ��ʾ��H=18��ƽ��
x = 0:0.2:30;
y = 0:1:209;
[X, Y]=meshgrid(x,y);
[lx, ly] = size(X);
Z = 18 + zeros(lx, ly);
plot3(X,Y,Z,'Color',[0.93 0.93 0.93]);

xlabel('��');ylabel('k');zlabel('H');
title(['����vΪ' num2str(v) 'ʱ ������,k��H�Ĺ�ϵ����ͼ']);
colormap hot;

end

