function hereditary_main()
% 使用基因遗传算法 确定函数 get_H(v, alpha, k) 的值接近18的最优解
% 其中 v=12或24 ; 0 < α < 16 ; 0 < k < 210 k∈Z
%==========================================================================
addpath(genpath(pwd));
clear
clc

% 定义参数变量
pop_size = 100;  % 种群大小
pc = 0.1;  % 交叉概率
pm = 0.1;  % 变异概率
v = 12;  % 风速 v=12或24
max_lteration = 200;  % 迭代次数

alpha_chromlength = 20;  % alpha种群二进制编码长度为20 范围为 0.~16. 小数 精确至小数点后6位 
k_chromlength = 7;  % k种群二进制编码长度7  范围为 0~210 整型
pop = initpop(pop_size,(alpha_chromlength+k_chromlength));  % 初始化种群

% 开始迭代
for i=1:max_lteration
    fit_value = cal_fit_value(pop, alpha_chromlength, v);  % 计算适应度值
    new_pop = selection(pop,fit_value);  % 选择操作
    new_pop = crossover(new_pop,pc);  % 交叉操作
    new_pop = mutation(new_pop,pm);  % 变异操作
    pop = new_pop;  % 更新种群
    [best_individual, best_fit]=best(pop, fit_value);  % 寻找最优个体
    [best_10_alpha, best_10_k] = binary2decimal(best_individual, alpha_chromlength);
    
    if mod(i,10) == 0
        % print出迭代过程的结果
        fprintf('第%i次迭代\n', i);
        fprintf('α = %f\n',best_10_alpha);
        fprintf('k = %i\n',best_10_k);
        get_H(v, best_10_alpha, best_10_k, 1);
        fprintf('=====================================================================\n');      
    end
end

end