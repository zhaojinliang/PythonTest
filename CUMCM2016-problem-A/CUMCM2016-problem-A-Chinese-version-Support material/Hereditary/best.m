function [best_individual, best_fit]=best(pop,fit_value)
% 计算种群中的最适应个体
% param: pop 种群基因序列
% param: fit_value 整个种群的每个个体的适应度
% return: 
%           best_individual 最适应个体的基因
%           best_fit 最适应个体的适应度
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

