function pop = initpop(pop_size,chromlength)
% 随机生成一个种群基因序列
% param: pop_size 种群大小
% param: chromlength 基因长度
% return: pop 种群基因序列
%==========================================================================

pop = round(rand(pop_size,chromlength));
end