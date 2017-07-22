%% ���·Dijkstra�㷨
function [r_path,r_cost]=dijkstra(pathS,pathE,transmat)
% The dijkstra's algorithm Implemented by zhao 2017
% pathS:�������·�������
% pathE:�������·�����յ�
% transmat��ͼ��ת�ƾ�������ڽӾ���ӦΪ����
if (size(transmat,1)~=size(transmat,2))
    error('detect_cycles:Dijkstra_SC',...
        'transmat has different width and height');
end
% ��ʼ����
% parent(i)-�ڵ�i�ĸ��ڵ�
% distance(i)-�����pathS�����·���ĳ���
% queue-ͼ�Ĺ�ȱ���
noOfNode=size(transmat,1);
for i=1:noOfNode
    parent(i)=0;%��ֵ����
    distance(i)=Inf;%��ֵ����
end
queue=[];%����

%��·����ʼ���·����
for i=1:noOfNode
    if transmat(pathS,i)~=Inf
        distance(i)=transmat(pathS,i);
        parent(i)=pathS;%��ǰ·��
        queue=[queue i];
    end
end
%��ͼ���й�ȱ���
while length(queue)~=0
    hopS=queue(1);
    queue=queue(2:end);
    for hopE=1:noOfNode
        if distance(hopE)>distance(hopS)+transmat(hopS,hopE)%�����ǰ�������ת����ľ���
            distance(hopE)=distance(hopS)+transmat(hopS,hopE);%����
            parent(hopE)=hopS;
            queue=[queue hopE];
        end
    end
end
%���ݽ������·���Ĳ���
r_path=[pathE];
i=parent(pathE);

while i~=pathS && i~=0
    r_path=[i r_path];
    i=parent(i);
end
if i==pathS
    r_path=[i r_path];%��¼
else
    r_path=[];%���
end
%�������·����Ȩ��
r_cost=distance(pathE);
%% %��������
% clc%����
% clear all%ɾ��workplace����
% close all;%�ر���ʾͼ�δ���
% clc,clear,close all
% w=[0 1 2 inf 7 4 8 inf;%��Ȩ�ڽӾ���
%     1 0 2 5 inf inf 7 inf;
%     2 2 0 1 5 inf inf inf;
%     inf 5 1 0 3 inf inf 6;
%     7 inf 5 3 0 3 inf 4;
%     4 inf inf inf 3 0 2 6;
%     8 7 inf inf inf 2 0 4;
%     inf inf inf 6 4 6 4 0];
%[r_path,r_cost]=dijkstra(1,8,w)%��1~8�ڵ�����·��

