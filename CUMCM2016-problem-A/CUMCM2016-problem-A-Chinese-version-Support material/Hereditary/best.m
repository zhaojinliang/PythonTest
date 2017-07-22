function [best_individual, best_fit]=best(pop,fit_value)
% ������Ⱥ�е�����Ӧ����
% param: pop ��Ⱥ��������
% param: fit_value ������Ⱥ��ÿ���������Ӧ��
% return: 
%           best_individual ����Ӧ����Ļ���
%           best_fit ����Ӧ�������Ӧ��
%==========================================================================

[px,py] = size(pop);
best_individual = pop(1,:);
best_fit = fit_value(1);
for i=2:px
    if fit_value(i)>best_fit
        best_individual = pop(i,:);
        best_fit = fit_value(i);
    end
end

