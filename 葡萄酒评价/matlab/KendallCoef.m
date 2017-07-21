function W = KendallCoef(X)
% 计算矩阵X的肯德尔和谐系数
% Input:
%           X:  X是一个N*K矩阵 N表示被评者的个数 K表示评委人数; X[i][j] 表示 评委j 对 被评者i 的评价等级
% Outputs:
%           W : 矩阵K的肯德尔和谐系数
%==========================================================================
[N,K] = size(X);
RankMatrix = zeros(N,K);
for i = 1:K
    temp = X(:,i);
    [a, b] = sortrows(temp);
    RankMatrix(b, i) = 1:N;
end
ranksum = sum(RankMatrix,2);
S1 = sum(ranksum.^2,1);
S2 = (sum(ranksum))^2;
S = S1 - S2/N;
temp = N^3 - N;
W = 12*S/(K^2*temp);
end

