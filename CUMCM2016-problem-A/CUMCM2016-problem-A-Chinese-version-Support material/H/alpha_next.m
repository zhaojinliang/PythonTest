function [alpha_2,T2] = alpha_next( alpha_1, p, T1 )
% param: alpha_1 ǰ����ˮƽ��֮��ĽǶ�
% param: p ÿһ�����ܵ������븡��֮��
% param: T1 ǰ���ܵ�������
% return: 
%   alpha_2 �����ˮƽ��֮��ĽǶ�
%   T2 ����ܵ�������    
%==========================================================================
alpha_2 = atan(tan(alpha_1) + p / (T1 * cos(alpha_1)));
T2 = T1 * cos(alpha_1) / cos(alpha_2);
end

