function new_pop = selection(pop,fit_value)
% 按照适应度的大小，随机选取个体存活。适应度越大的个体，存活的机率越高。
% param: pop 种群基因序列
% param: fit_value 整个种群的每个个体的适应度
% return: 
%           new_pop 新的种群的基因序列
%==========================================================================

% 构造轮盘
[px, py]=size(pop);
fit_value = mapminmax(fit_value', 0, 1);  % 由于适应度都为负值，需进行归一化
total_fit = sum(fit_value);
p_fitvalue = fit_value / total_fit; 
p_fitvalue = cumsum(p_fitvalue);  % 概率求和排序

ms = sort(rand(px,1));  % 从小到大排列
fitin = 1;
newin = 1;
while newin <= px
     if (ms(newin)) < p_fitvalue(fitin)
        new_pop(newin, :) = pop(fitin, :);
         newin = newin + 1;
     else fitin = fitin +1 ;
     end

 end