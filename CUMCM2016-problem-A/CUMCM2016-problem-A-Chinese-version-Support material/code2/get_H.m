function [H, L, yitas] = get_H(v,alpha_1, k, g)
%param: alpha_1 第一段钢管与海床之间的角度
%param: k 躺下的钢条的个数
%param: v 风速
%param: g 重物球的重量
%==========================================================================
H = 0;
L = 0;
alpha = zeros(1,211);
alpha(1) = alpha_1 / 180 * pi;
T = zeros(1,211);
beta = zeros(1,4);
F = zeros(1,4);
[h, T(1)] = alpha_h(alpha(1), v, k, g);
for i= 1:210-k
    [alpha(i+1),T(i+1)]=alpha_next(alpha(i),7.35,T(i));
    H = H + 0.105 * sin(alpha(i));
    L = L + 0.105 * cos(alpha(i));
end
    beta(4) = atan((32185*h-10000)/((2.5 - 1.25*h) * v^2));
    F(4)= (2.5 - 1.25*h) * v^2/ cos(beta(4));
    
for i=4:-1:1
    if i > 1 
    [beta(i-1),F(i-1)]=beta_forward(beta(i),79.88,F(i));
    end
     H = H + sin(beta(i));
     L = L + cos(beta(i));
end
 H = H + h;
 yita = atan((T(210-k)*sin(alpha(210-k))+F(4)*sin(beta(4)))/(T(210-k)*cos(alpha(210-k))+F(4)*cos(beta(4))));
 yitas = yita / pi * 180;
 H = H + sin(yita);
 L = L + cos(yita);
end

