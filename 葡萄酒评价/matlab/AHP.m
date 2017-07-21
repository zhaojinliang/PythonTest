function Q = AHP(A )
% 层次分析法 AHP
% Input:
%           A:  A是正互反的比较矩阵
% Output:
%           Q:  特征向量(标准化)
%==========================================================================
[m, n] = size(A);  % 获取指标个数
RI = [0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];
R = rank(A);  % 求判断矩阵的秩
[V, D] = eig(A);  % 求矩阵的特征值和特征向量，V特征值，D特征向量；
B = max(max(D));  % 最大特征值
disp('最大特征值');
disp(B);
[row, col] = find(D==B);  % 最大特征值所在位置
C = V(:, col);  % 对应特征向量
CI = ( B - n ) / ( n - 1 );  % 计算一致性检验指标CI
CR = CI / RI(n);  % 随机一致性比率 CR
if CR < 0.10  % 对比矩阵A通过一致性检验
    disp('CI');disp(CI);
    disp('RI'); disp (RI(n));
    disp('CR'); disp(CR);
    Q = zeros(n, 1);
    for i=1:n
        Q(i, 1) = C(i, 1) / sum(C(:, 1));  % 特征向量标准化
    end
    disp ('特征向量(标准化)');disp(Q);
else
    disp('对比矩阵A未通过一致性检验，需对对比矩阵重新构造');
end

end

