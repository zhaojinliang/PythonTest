%% ���·ford�㷨--folyd�㷨����
clc%����
clear all%ɾ��workplace����
close all;%�ر���ʾͼ�δ���
clc,clear,close all
x7=[0 1 inf inf inf 2;%D0
    1 0 4 inf inf 4;
    inf inf 2 0 3 3;
    inf inf inf 3 0 5;
    2 4 1 3 5 0];
n=length(x7);
path=zeros(n);
%flody��С���뷨
for k=1:n
    for i=1:n
        for j=1:n
            if x7(i,j)>x7(i,k)+x7(k,j)%�ڵ�ֱ�����Ӵ����м����Ľڵ�ʱ
                x7(i,j)=x7(i,k)+x7(k,j);%��¼����
                path(i,j)=k;%·�ɺż�¼
            end
        end
    end
end
x7
path

    