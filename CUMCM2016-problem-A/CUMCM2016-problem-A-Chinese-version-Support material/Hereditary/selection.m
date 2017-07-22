function new_pop = selection(pop,fit_value)
% ������Ӧ�ȵĴ�С�����ѡȡ�������Ӧ��Խ��ĸ��壬���Ļ���Խ�ߡ�
% param: pop ��Ⱥ��������
% param: fit_value ������Ⱥ��ÿ���������Ӧ��
% return: 
%           new_pop �µ���Ⱥ�Ļ�������
%==========================================================================

% ��������
[px, py]=size(pop);
fit_value = mapminmax(fit_value', 0, 1);  % ������Ӧ�ȶ�Ϊ��ֵ������й�һ��
total_fit = sum(fit_value);
p_fitvalue = fit_value / total_fit; 
p_fitvalue = cumsum(p_fitvalue);  % �����������

ms = sort(rand(px,1));  % ��С��������
fitin = 1;
newin = 1;
while newin <= px
     if (ms(newin)) < p_fitvalue(fitin)
        new_pop(newin, :) = pop(fitin, :);
         newin = newin + 1;
     else fitin = fitin +1 ;
     end

 end