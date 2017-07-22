function [h, T1]=alpha_h(alpha_1, v, k, g)
% param: alpha_1 第一段锚链与水平面之间的角度
% param: v 风速
% param: g 重物球的重量
% return: h 浸水深度
%         T1 锚在水中受到的拉力
%==========================================================================
syms h;
h = solve(tan(alpha_1) == ((32185*h - 24138.875+7.35*k-g+12000) / ((2.5 - 1.25*h) * v^2)), h);
h = vpa(h);
syms T1;
T1 = solve(T1 * cos(alpha_1) == (2.5-1.25*h) * v^2, T1);
T1 = vpa(T1);
end