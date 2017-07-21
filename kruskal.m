%% 最小数kruskal算法
clc,clear,close all
M=1000;
a(1,2)=50;a(1,3)=60;%初始网络值-邻接矩阵的赋值
a(2,4)=65;a(2,5)=40;
a(3,4)=52;a(3,7)=45;
a(4,5)=50;a(4,6)=30;a(4,7)=42;
a(5,6)=70;
[i,j]=find((a~=0)&(a~=M));%对角线赋值为0
b=a(find((a~=0)&(a~=M)));%矩阵中不为0和M的数
data=[i';j';b'];index=data(1:2,:);%赋值
loop=max(size(a)-1);%循环次数
result=[];%初始化
while length(result)<loop
    temp=min(data(3,:));%取最小
    flag=find(data(3,:)==temp);%查找是否相等的元素，想等为1，不想等为0
    flag=flag(1);
    v1=data(1,flag);v2=data(2,flag);%赋值
    if index(1,flag)~=index(2,flag)%如果不等结果保留
        result=[result,data(:,flag)];
    end
    if v1>v2
        index(find(index==v1))=v2;%继续查找，更新
    else
        index(find(index==v2))=v1;%继续查找，更新
    end
    data(:,flag)=[];
    index(:,flag)=[];
end
result %输出结果