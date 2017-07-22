function [pop_10_alpha, pop_10_k] = binary2decimal(pop, spl)
% ����Ⱥ����ת��Ϊʮ���ƵĦ�ֵ��kֵ
% param: pop ��Ⱥ��������
% param: spl ��������k����Ļ���λ��
% return: 
%       pop_10_alpha ʮ���Ʀ�ֵ
%       pop_10_k ʮ����kֵ
%==========================================================================

temp = char(pop+'0');  % ������ת��Ϊ�ַ���
py = size(pop, 2);
pop_10_alpha = bin2dec(temp(:, 1:spl));  % ������������ת��Ϊ10����
pop_10_alpha = pop_10_alpha * 16 / (2^spl-1);  % ������0~16�ķ�Χ��
pop_10_k = bin2dec(temp(:, spl+1: py));  % ��k��������ת��Ϊ10����

end
