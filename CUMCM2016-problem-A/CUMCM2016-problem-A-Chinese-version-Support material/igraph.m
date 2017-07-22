function igraph()
% 构建在风速v不同的情况下 变量α,k与H的关系函数图

clc;
clear;
addpath(genpath(pwd));


v = 36;  % 风速

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

% 绘图
figure;
% 绘制3d函数图 H = f(v, α, k) 其中v为定量
mesh(X,Y,Z);
hold on;
% 标示出H=18的平面
x = 0:0.2:30;
y = 0:1:209;
[X, Y]=meshgrid(x,y);
[lx, ly] = size(X);
Z = 18 + zeros(lx, ly);
plot3(X,Y,Z,'Color',[0.93 0.93 0.93]);

xlabel('α');ylabel('k');zlabel('H');
title(['风速v为' num2str(v) '时 变量α,k与H的关系函数图']);
colormap hot;

end

