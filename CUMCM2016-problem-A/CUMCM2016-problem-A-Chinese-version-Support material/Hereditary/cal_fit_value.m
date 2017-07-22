function fit_value=cal_fit_value(pop, spl, v)
% 计算适应度值，所求得的H值越接近18则适应度越高
% param: pop 种群基因序列
% param: spl α与k的基因分割点
% param: v 风速 get_H()函数所需的参数
% return: fit_value 整个种群的每个个体的适应度
%==========================================================================

[x, y] = binary2decimal(pop, spl);
pop_num = size(x);
fit_value = zeros(pop_num);
for i = 1:pop_num
    fit_value(i) = -abs(get_H(v, x(i), y(i))-18);  % v,alpha,k
end