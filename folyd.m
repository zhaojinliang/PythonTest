%% 最短路ford算法--folyd算法步骤
clc%清屏
clear all%删除workplace变量
close all;%关闭显示图形窗口
clc,clear,close all
x7=[0 1 inf inf inf 2;%D0
    1 0 4 inf inf 4;
    inf inf 2 0 3 3;
    inf inf inf 3 0 5;
    2 4 1 3 5 0];
n=length(x7);
path=zeros(n);
%flody最小距离法
for k=1:n
    for i=1:n
        for j=1:n
            if x7(i,j)>x7(i,k)+x7(k,j)%节点直接连接大于中间插入的节点时
                x7(i,j)=x7(i,k)+x7(k,j);%记录更新
                path(i,j)=k;%路由号记录
            end
        end
    end
end
x7
path

    