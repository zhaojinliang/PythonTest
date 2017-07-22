clc;
clear;

%% 初始参数
dim = 3;  % 粒子维数
x_size = 50;  % 种群个数
max_lteration = 200;  % 迭代次数 
wmax = 1.2;  % 惯性因子
wmin = 0.1;  % 惯性因子
c1 = 0.8;  % 算法参数
c2 = 0.8;  % 算法参数 

% 粒子初始化
g = randsrc(x_size, 1, 8000:20000);
h = rand(x_size, 1);
n = randsrc(x_size, 1, 120:300);
x = [g, h, n];

v = zeros(x_size,dim);  % 速度初始化

x_best = x;  % 个体最佳值
g_best = x(1,:);  % 粒子群最佳位置

% 粒子适应度值 
yita_f = zeros(1, x_size);  % yita(1)约束  85 < yita(1) < 90
alpha_f = zeros(1, x_size);  % alpha约束  0 < alpha < 16
T0_f = zeros(1, x_size);  % T0约束 T0 > 0
Hu_f = zeros(1, x_size);  % 粒子 Hu目标值 Hu->20
C_f = zeros(1, x_size);  % 粒子 C目标值 C->0 且 C>0

% 上一次的值
yita_fPrior = zeros(1, x_size);
alpha_fPrior = zeros(1, x_size);
T0_fPrior = zeros(1, x_size);
Hu_fPrior = zeros(1, x_size);
C_fPrior = zeros(1, x_size);

% 计算初始目标向量
for i=1:x_size
    [yita, alpha, T0, Hu, C] = Gain_H(x(i,1), x(i,2), x(i,3));
    yita_f(i) = yita;
    alpha_f(i) = alpha;
    T0_f(i) = T0;
    Hu_f(i) = Hu;
    C_f(i) = C;
end

% 粒子最优适应度
yita_fBest = yita_f;
alpha_fBest = alpha_f; 
T0_fBest = T0_f;
Hu_fBest = Hu_f; 
C_fBest = C_f;



%% 初始筛选非劣解
flj = [];  % 非劣解
fljx = [];  % 非劣解的位置
%两个实数相等精度
tol = 1e-7;
for i = 1:x_size
    flag=0;  % 支配标志
	for j=1:x_size  
        if j~=i
            if ( (yita_f(j)>90)||(yita_f(j)<85)...
                    ||(C_f(j)<0)...
                    ||(alpha_f(j)<0)||(alpha_f(j)>16)...
                    ||(T0_f(j)<0)...
                    ||((abs(Hu_f(i)-20)>abs(Hu_f(j)-20))&&(abs(C_f(i)-0)>abs(C_f(j)-0))) )
                flag = 1;
                break;
            end
        end
	end
    
    %判断有无被支配
    flj_num = 0;
    if flag==0
        flj_num = flj_num+1;
        % 记录非劣解
        flj(flj_num, 1) = yita_f(i);
        flj(flj_num, 2) = alpha_f(i);
        flj(flj_num, 3) = T0_f(i);
        flj(flj_num, 4) = Hu_f(i);
        flj(flj_num, 5) = C_f(i);
        % 非劣解位置
        fljx(flj_num, :) = x(i, :); 
    end
end

%% 循环迭代
for iter=1:max_lteration  
    % 权值更新
    w = wmax - (wmax-wmin) * iter / max_lteration;  % 惯性因子随着迭代越来越小
   
    % 从非劣解集中随机选择粒子作为全局最优解
    s = size(fljx,1);       
    index = randi(s,1,1);  
    g_best = fljx(index,:);

    %% 群体更新
    for i=1:x_size
        % 速度更新
        v(i,:)=w*v(i,:)+c1*rand(1,1)*(x_best(i,:)-x(i,:))+c2*rand(1,1)*(g_best-x(i,:));
        
        % 位置更新
        x(i,:)=x(i,:)+v(i,:);
        % 处理g h n越界问题
        if x(i,1) < 8000  % 8000<g<20000
            x(i,1) = x(i,1) + 12000;
        end
        if x(i,1) > 20000
            x(i,1) = 8000 + mod(x(i,1), 20000);
        end
        if x(i,2)<0 || x(i,2)>1  %  0<h<1
            x(i,2) = rand(1,1);
        end
        if x(i,3) < 120  % 120<n<300
            x(i,3) = x(i,3) + 180;
        end
        if x(i,3) > 300
            x(i,3) = 120 + mod(x(i,3), 300);
        end 
    end
    
    %% 计算个体适应度
    yita_fPrior(:) = 0;
    alpha_fPrior(:) = 0;
    T0_fPrior(:) = 0;
    Hu_fPrior(:) = 0;
    C_fPrior(:) = 0;
    for i=1:x_size
        [yita, alpha, T0, Hu, C] = Gain_H(x(i,1), x(i,2), x(i,3));
        yita_fPrior(i) = yita;
        alpha_fPrior(i) = alpha;
        T0_fPrior(i) = T0;
        Hu_fPrior(i) = Hu;
        C_fPrior(i) = C;
    end

    %% 更新粒子历史最佳
    for i=1:x_size
        %现在的支配原有的，替代原有的
        if( (yita_f(i)>90)||(yita_f(i)<85)...
                    ||(C_f(i)<0)...
                    ||(alpha_f(i)<0)||(alpha_f(i)>16)...
                    ||(T0_f(i)<0)...
                    ||((abs(Hu_f(i)-20)>abs(Hu_fPrior(i)-20))&&(abs(C_f(i)-0)>abs(C_fPrior(i)-0))) )
                x_best(i,:)=x(i,:);
        end
        %彼此不受支配，随机决定
        if ~( (yita_f(i)>90)||(yita_f(i)<85)...
                    ||(C_f(i)<0)...
                    ||(alpha_f(i)<0)||(alpha_f(i)>16)...
                    ||(T0_f(i)<0)...
                    ||((abs(Hu_f(i)-20)>abs(Hu_fPrior(i)-20))&&(abs(C_f(i)-0)>abs(C_fPrior(i)-0))) )...
                &&~( (yita_fPrior(i)>90)||(yita_fPrior(i)<85)...
                    ||(C_fPrior(i)<0)...
                    ||(alpha_fPrior(i)<0)||(alpha_fPrior(i)>16)...
                    ||(T0_fPrior(i)<0)...
                    ||((abs(Hu_f(i)-20)<abs(Hu_fPrior(j)-20))&&(abs(C_f(i)-0)<abs(C_fPrior(j)-0))) )
            if rand(1,1)<0.5
                x_best(i,:)=x(i,:);
                % 更新目标值
                yita_fBest(i)=yita_fPrior(i);
                alpha_fBest(i)=alpha_fPrior(i);
                T0_fBest(i)=T0_fPrior(i);
                Hu_fBest(i)=Hu_fPrior(i);
                C_fBest(i)=C_fPrior(i);
            end
        end
    end
    
    %% 更新非劣解集合
    yita_f = yita_fBest;
    alpha_f = alpha_fBest;
    T0_f = T0_fBest;
    Hu_f = Hu_fBest;
    C_f = C_fBest;

    % 更新升级非劣解集合
    s=size(flj,1);  % 目前非劣解集合中元素个数
   
    %先将非劣解集合和xbest合并
    yita_f_b = zeros(1,s+x_size);
    alpha_f_b = zeros(1,s+x_size); 
    T0_f_b = zeros(1,s+x_size);
    Hu_f_b = zeros(1,s+x_size);
    C_f_b = zeros(1,s+x_size);
    yita_f_b(1:x_size) = yita_fBest; yita_f_b(x_size+1:end)=flj(:, 1)';
    alpha_f_b(1:x_size) = yita_fBest; alpha_f_b(x_size+1:end)=flj(:, 2)';
    T0_f_b(1:x_size) = yita_fBest; T0_f_b(x_size+1:end)=flj(:, 3)';
    Hu_f_b(1:x_size) = yita_fBest; Hu_f_b(x_size+1:end)=flj(:, 4)';
    C_f_b(1:x_size) = yita_fBest; C_f_b(x_size+1:end)=flj(:, 5)';
    xxbest=zeros(s+x_size,dim);
    xxbest(1:x_size,:)=x_best;
    xxbest(x_size+1:end,:)=fljx;
    
    %筛选非劣解
    flj=[];
    fljx=[];
    k = 0;
    tol=1e-7;
    for i=1:x_size+s
        flag = 0;  % 没有被支配
        % 判断该点是否非劣
        for j=1:x_size+s 
            if j~=i
                if( (yita_f_b(j)>90)||(yita_f_b(j)<85)...
                    ||(C_f_b(j)<0)...
                    ||(alpha_f_b(j)<0)||(alpha_f_b(j)>16)...
                    ||(T0_f_b(j)<0)...
                    ||((abs(Hu_f_b(i)-20)>abs(Hu_f_b(j)-20))&&(abs(C_f_b(i)-0)>abs(C_f_b(j)-0))) )
                    flag=1;
                    break;
                end
            end
        end

        %判断有无被支配
        if flag==0
            k = k + 1;
            flj(k, 1) = yita_f_b(i);
            flj(k, 2) = alpha_f_b(i);
            flj(k, 3) = T0_f_b(i);
            flj(k, 4) = Hu_f_b(i);
            flj(k, 5) = C_f_b(i);
            fljx(k,:) = xxbest(i,:);%非劣解位置
        end
    end

    %去掉重复粒子
    repflag = 0;  % 重复标志
    k = 1;  % 不同非劣解粒子数
    flj_new = [];  % 存储不同非劣解
    fljx_new = [];  % 存储不同非劣解粒子位置
    flj_new(k,:) = flj(1,:);
    fljx_new(k,:) = fljx(1,:);
    for j=2:size(flj,1)
        repflag = 0;  % 重复标志
        for i=1:size(flj_new, 1)
            result=(fljx(j,:)==fljx_new(i,:));
            if length(find(result==1))==dim
                repflag=1;  % 有重复
            end
        end
        %粒子不同，存储
        if repflag==0 
            k=k+1;
            flj_new(k,:)=flj(j,:);
            fljx_new(k,:)=fljx(j,:);
        end       
    end    
    %非劣解更新
    flj=flj_new;
    fljx=fljx_new;
end

len = size(flj, 1)
for i = 1:len
    i
    flj(i,:)
    fjlx(i,:)
    fprintf('==================');
    
end