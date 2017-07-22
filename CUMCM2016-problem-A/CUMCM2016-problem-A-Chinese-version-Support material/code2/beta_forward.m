function [beta_1,T1] = beta_forward(beta_2 ,p , T2)
% param: T2 后段受到的拉力
% param: beta_2 后段与水平面之间的角度
% param: p 每一段所受的重力与浮力之差
% retun: T1 前段受到的拉力
%        beta_1 前段与水平面之间的角度
%==========================================================================
beta_1 = atan((tan(beta_2) -   p / (T2 * cos(beta_2))));
T1= T2*cos(beta_2)/cos(beta_1);
end