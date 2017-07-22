function [new_pop]=crossover(pop, pc)
% 计算适应度值，所求得的H值越接近18适应度越高
% param: pop 父代种群基因序列
% param: pc 交叉的概率
% return: new_pop 新的种群基因序列
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