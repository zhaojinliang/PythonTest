function [H, L] = get_H(v,alpha_1, k, is_print)
%param: alpha_1 第一段钢管与海床之间的角度
%param: k 躺下的钢条的个数
%param: v 风速
%==========================================================================
if nargin < 4
    is_print = 0;  % 默认不print出相关数据
end
H = 0;
L = 0;
alpha = zeros(1,211);
alpha(1) = alpha_1 / 180 * pi;
T = zeros(1,211);
beta = zeros(1,4);
F = zeros(1,4);
[h, T(1)] = alpha_h(alpha(1), v, k);
for i= 1:210-k
    [alpha(i+1),T(i+1)]=alpha_next(alpha(i),7.35,T(i));
    H = H + 0.105 * sin(alpha(i));
    L = L + 0.105 * cos(alpha(i));
end
    beta(4) = atan((32185*h-10000)/((2.5 - 1.25*h) * v^2));
    F(4)= (2.5 - 1.25*h) * v^2/ cos(beta(4));
    
for i=4:-1:1
    if i > 1 
    [beta(i-1),F(i-1)] = beta_forward(beta(i),79.88,F(i));
    end
     H = H + sin(beta(i));
     L = L + cos(beta(i));
end
 H = H + h;
 yita = atan((T(210-k)*sin(alpha(210-k))+F(4)*sin(beta(4)))/(T(210-k)*cos(alpha(210-k))+F(4)*cos(beta(4))));
 H = H + sin(yita);
 L = L + cos(yita)+k*0.105;
 
% print出相关数据
if is_print==1
    fprintf('β_1 = %f  β_2 = %f  β_3 = %f  β_4 = %f\n',beta(1),beta(2),beta(3),beta(4));
    fprintf('λ = %f\n', yita);
    fprintf('h = %f\n', h);
    fprintf('L = %f\n', L);
    fprintf('H = %f\n', double(H));
end
end

