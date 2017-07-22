function [new_pop] = mutation(pop, pm)
% 原来的种群基因序列有一定的机率发生变异
% param: pop 种群的基因序列
% param: pm 基因发生变异的机率
% return: new_pop 变异后的新的基因序列
%==========================================================================
[px,py] = size(pop);
new_pop = ones(size(pop));
for i = 1:px
    if(rand<pm)
        mpoint = round(rand*py);
        if mpoint<=0
            mpoint = 1;
        end
        new_pop(i,:) = pop(i,:);
        if new_pop(i, mpoint)==0
            new_pop(i, mpoint) = 1;
        else new_pop(i, mpoint) = 0;
        end
    else
        new_pop(i, :)=pop(i, :);
    end
end
end

