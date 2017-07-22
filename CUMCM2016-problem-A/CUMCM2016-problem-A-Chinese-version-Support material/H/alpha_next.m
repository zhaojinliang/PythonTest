function [alpha_2,T2] = alpha_next( alpha_1, p, T1 )
% param: alpha_1 前段与水平面之间的角度
% param: p 每一段所受的重力与浮力之差
% param: T1 前段受到的拉力
% return: 
%   alpha_2 后段与水平面之间的角度
%   T2 后段受到的拉力    
%==========================================================================
alpha_2 = atan(tan(alpha_1) + p / (T1 * cos(alpha_1)));
T2 = T1 * cos(alpha_1) / cos(alpha_2);
end

