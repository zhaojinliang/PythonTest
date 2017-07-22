function hereditary_main()
% ʹ�û����Ŵ��㷨 ȷ������ get_H(v, alpha, k) ��ֵ�ӽ�18�����Ž�
% ���� v=12��24 ; 0 < �� < 16 ; 0 < k < 210 k��Z
%==========================================================================
addpath(genpath(pwd));
clear
clc

% �����������
pop_size = 100;  % ��Ⱥ��С
pc = 0.1;  % �������
pm = 0.1;  % �������
v = 12;  % ���� v=12��24
max_lteration = 200;  % ��������

alpha_chromlength = 20;  % alpha��Ⱥ�����Ʊ��볤��Ϊ20 ��ΧΪ 0.~16. С�� ��ȷ��С�����6λ 
k_chromlength = 7;  % k��Ⱥ�����Ʊ��볤��7  ��ΧΪ 0~210 ����
pop = initpop(pop_size,(alpha_chromlength+k_chromlength));  % ��ʼ����Ⱥ

% ��ʼ����
for i=1:max_lteration
    fit_value = cal_fit_value(pop, alpha_chromlength, v);  % ������Ӧ��ֵ
    new_pop = selection(pop,fit_value);  % ѡ�����
    new_pop = crossover(new_pop,pc);  % �������
    new_pop = mutation(new_pop,pm);  % �������
    pop = new_pop;  % ������Ⱥ
    [best_individual, best_fit]=best(pop, fit_value);  % Ѱ�����Ÿ���
    [best_10_alpha, best_10_k] = binary2decimal(best_individual, alpha_chromlength);
    
    if mod(i,10) == 0
        % print���������̵Ľ��
        fprintf('��%i�ε���\n', i);
        fprintf('�� = %f\n',best_10_alpha);
        fprintf('k = %i\n',best_10_k);
        get_H(v, best_10_alpha, best_10_k, 1);
        fprintf('=====================================================================\n');      
    end
end

end