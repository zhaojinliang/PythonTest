function [new_pop]=crossover(pop, pc)
% ������Ӧ��ֵ������õ�HֵԽ�ӽ�18��Ӧ��Խ��
% param: pop ������Ⱥ��������
% param: pc ����ĸ���
% return: new_pop �µ���Ⱥ��������
%==========================================================================

[px,py]=size(pop);
new_pop = ones(size(pop));
for i=1:2:px-1
    if(rand<pc)
        cpoint = round(rand*py);
        new_pop(i,:) = [pop(i, 1:cpoint), pop(i+1, cpoint+1:py)];
        new_pop(i+1,:) = [pop(i+1, 1:cpoint), pop(i, cpoint+1:py)];
    else
        new_pop(i, :) = pop(i, :);
        new_pop(i+1, :) = pop(i+1, :);
    end
end
end