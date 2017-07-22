function fit_value=cal_fit_value(pop, spl, v)
% ������Ӧ��ֵ������õ�HֵԽ�ӽ�18����Ӧ��Խ��
% param: pop ��Ⱥ��������
% param: spl ����k�Ļ���ָ��
% param: v ���� get_H()��������Ĳ���
% return: fit_value ������Ⱥ��ÿ���������Ӧ��
%==========================================================================

[x, y] = binary2decimal(pop, spl);
pop_num = size(x);
fit_value = zeros(pop_num);
for i = 1:pop_num
    fit_value(i) = -abs(get_H(v, x(i), y(i))-18);  % v,alpha,k
end