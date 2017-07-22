%% 最短路Dijkstra算法
function [r_path,r_cost]=dijkstra(pathS,pathE,transmat)
% The dijkstra's algorithm Implemented by zhao 2017
% pathS:所求最短路径的起点
% pathE:所求最短路径的终点
% transmat：图的转移矩阵或者邻接矩阵，应为方阵
if (size(transmat,1)~=size(transmat,2))
    error('detect_cycles:Dijkstra_SC',...
        'transmat has different width and height');
end
% 初始化：
% parent(i)-节点i的父节点
% distance(i)-从起点pathS的最短路径的长度
% queue-图的广度遍历
noOfNode=size(transmat,1);
for i=1:noOfNode
    parent(i)=0;%初值操作
    distance(i)=Inf;%初值操作
end
queue=[];%队列

%由路径开始最短路计算
for i=1:noOfNode
    if transmat(pathS,i)~=Inf
        distance(i)=transmat(pathS,i);
        parent(i)=pathS;%当前路径
        queue=[queue i];
    end
end
%对图进行广度遍历
while length(queue)~=0
    hopS=queue(1);
    queue=queue(2:end);
    for hopE=1:noOfNode
        if distance(hopE)>distance(hopS)+transmat(hopS,hopE)%如果当前距离大于转换后的距离
            distance(hopE)=distance(hopS)+transmat(hopS,hopE);%更新
            parent(hopE)=hopS;
            queue=[queue hopE];
        end
    end
end
%回溯进行最短路径的查找
r_path=[pathE];
i=parent(pathE);

while i~=pathS && i~=0
    r_path=[i r_path];
    i=parent(i);
end
if i==pathS
    r_path=[i r_path];%记录
else
    r_path=[];%清空
end
%返回最短路径的权和
r_cost=distance(pathE);
%% %主屏程序
% clc%清屏
% clear all%删除workplace变量
% close all;%关闭显示图形窗口
% clc,clear,close all
% w=[0 1 2 inf 7 4 8 inf;%带权邻接矩阵
%     1 0 2 5 inf inf 7 inf;
%     2 2 0 1 5 inf inf inf;
%     inf 5 1 0 3 inf inf 6;
%     7 inf 5 3 0 3 inf 4;
%     4 inf inf inf 3 0 2 6;
%     8 7 inf inf inf 2 0 4;
%     inf inf inf 6 4 6 4 0];
%[r_path,r_cost]=dijkstra(1,8,w)%从1~8节点的最短路径

