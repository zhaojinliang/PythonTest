%% 层次分析法基本原理与步骤
clc,clear,close all    %清屏
a=[1,1,1,4,1,1/2 %准则层权重因子
    1,1,2,4,1,1/2
    1,1/2,1,5,3,1/2
    1/4,1/4,1/5,1,1/3,1/3
    1,1,1/3,3,1,1
    2,2,2,3,3,1];
[x,y]=eig(a);%求特征值
eigenvalue=diag(y);%提取y矩阵的对角值
lambda=eigenvalue(1);
cil=(lambda-6)/5;
crl=cil/1.24;
w1=x(:,1)/sum(x(:,1))%准则层权值


%% 准则层1
b1=[1,1/4,1/2;4,1,3;2,1/3,1];
[x,y]=eig(b1);%求特征值
eigenvalue=diag(y);%提取y矩阵的对角值
lambda=eigenvalue(1);
ci21=(lambda-3)/2;
cr2l=ci21/0.58;
w21=x(:,1)/sum(x(:,1))%研究课题


%% 准则层2
b2=[1,1/4,1/5;4,1,1/2;5,2,1];
[x,y]=eig(b2);%求特征值
eigenvalue=diag(y);%对角化
lambda=eigenvalue(1);
ci22=(lambda-3)/2;
cr22=ci22/0.58;
w22=x(:,1)/sum(x(:,1))%发展前途


%% 准则层3
b3=[1,3,1/3;1/3,1,1/7;3,7,1];
[x,y]=eig(b3);%求特征值
eigenvalue=diag(y);%对角化
lambda=eigenvalue(1);
ci23=(lambda-3)/2;
cr23=ci23/0.58;
w23=x(:,1)/sum(x(:,1))%待遇


%% 准则层4
b4=[1,1/3,5;3,1,7;1/5,1/7,1];
[x,y]=eig(b4);%求特征值
eigenvalue=diag(y);%对角化
lambda=eigenvalue(1);
ci24=(lambda-3)/2;
cr24=ci24/0.58;
w24=x(:,1)/sum(x(:,1))%同时情况

%% 准则层5
b5=[1,1,7;1,1,7;1/7,1/7,1];
[x,y]=eig(b5);%求特征值
eigenvalue=diag(y);%对角化
lambda=eigenvalue(1);
ci25=(lambda-3)/2;
cr25=ci25/0.58;
w25=x(:,1)/sum(x(:,1))%地理位置

%% 准则层6
b6=[1,7,9;1/7,1,1;1/9,1,1];
[x,y]=eig(b6);%求特征值
eigenvalue=diag(y);%对角化
lambda=eigenvalue(1);
ci26=(lambda-3)/2;
cr26=ci26/0.58;
w26=x(:,1)/sum(x(:,1))%单位名气

%% 总排序
w_sum=[w21,w22,w23,w24,w25,w26]*w1;
ci=[ci21,ci22,ci23,ci24,ci25,ci26];
cr=ci*w1/sum(0.58*w1)   %总排序权值