%% ��С��kruskal�㷨
clc,clear,close all
M=1000;
a(1,2)=50;a(1,3)=60;%��ʼ����ֵ-�ڽӾ���ĸ�ֵ
a(2,4)=65;a(2,5)=40;
a(3,4)=52;a(3,7)=45;
a(4,5)=50;a(4,6)=30;a(4,7)=42;
a(5,6)=70;
[i,j]=find((a~=0)&(a~=M));%�Խ��߸�ֵΪ0
b=a(find((a~=0)&(a~=M)));%�����в�Ϊ0��M����
data=[i';j';b'];index=data(1:2,:);%��ֵ
loop=max(size(a)-1);%ѭ������
result=[];%��ʼ��
while length(result)<loop
    temp=min(data(3,:));%ȡ��С
    flag=find(data(3,:)==temp);%�����Ƿ���ȵ�Ԫ�أ����Ϊ1�������Ϊ0
    flag=flag(1);
    v1=data(1,flag);v2=data(2,flag);%��ֵ
    if index(1,flag)~=index(2,flag)%������Ƚ������
        result=[result,data(:,flag)];
    end
    if v1>v2
        index(find(index==v1))=v2;%�������ң�����
    else
        index(find(index==v2))=v1;%�������ң�����
    end
    data(:,flag)=[];
    index(:,flag)=[];
end
result %������