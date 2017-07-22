function [beta_1,T1] = beta_forward(beta_2 ,p , T2)
% param: T2 ����ܵ�������
% param: beta_2 �����ˮƽ��֮��ĽǶ�
% param: p ÿһ�����ܵ������븡��֮��
% retun: T1 ǰ���ܵ�������
%        beta_1 ǰ����ˮƽ��֮��ĽǶ�
%==========================================================================
beta_1 = atan((tan(beta_2) -   p / (T2 * cos(beta_2))));
T1= T2*cos(beta_2)/cos(beta_1);
end