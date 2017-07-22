function [pop_10_alpha, pop_10_k] = binary2decimal(pop, spl)
% 将种群基因转化为十进制的α值和k值
% param: pop 种群基因序列
% param: spl α基因与k基因的划分位置
% return: 
%       pop_10_alpha 十进制α值
%       pop_10_k 十进制k值
%==========================================================================

temp = char(pop+'0');  % 将数组转化为字符串
py = size(pop, 2);
pop_10_alpha = bin2dec(temp(:, 1:spl));  % 将α基因序列转化为10进制
pop_10_alpha = pop_10_alpha * 16 / (2^spl-1);  % 控制在0~16的范围内
pop_10_k = bin2dec(temp(:, spl+1: py));  % 将k基因序列转化为10进制

end
