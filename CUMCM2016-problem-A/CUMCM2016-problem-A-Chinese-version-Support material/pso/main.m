clc;
clear;

%% ��ʼ����
dim = 3;  % ����ά��
x_size = 50;  % ��Ⱥ����
max_lteration = 200;  % �������� 
wmax = 1.2;  % ��������
wmin = 0.1;  % ��������
c1 = 0.8;  % �㷨����
c2 = 0.8;  % �㷨���� 

% ���ӳ�ʼ��
g = randsrc(x_size, 1, 8000:20000);
h = rand(x_size, 1);
n = randsrc(x_size, 1, 120:300);
x = [g, h, n];

v = zeros(x_size,dim);  % �ٶȳ�ʼ��

x_best = x;  % �������ֵ
g_best = x(1,:);  % ����Ⱥ���λ��

% ������Ӧ��ֵ 
yita_f = zeros(1, x_size);  % yita(1)Լ��  85 < yita(1) < 90
alpha_f = zeros(1, x_size);  % alphaԼ��  0 < alpha < 16
T0_f = zeros(1, x_size);  % T0Լ�� T0 > 0
Hu_f = zeros(1, x_size);  % ���� HuĿ��ֵ Hu->20
C_f = zeros(1, x_size);  % ���� CĿ��ֵ C->0 �� C>0

% ��һ�ε�ֵ
yita_fPrior = zeros(1, x_size);
alpha_fPrior = zeros(1, x_size);
T0_fPrior = zeros(1, x_size);
Hu_fPrior = zeros(1, x_size);
C_fPrior = zeros(1, x_size);

% �����ʼĿ������
for i=1:x_size
    [yita, alpha, T0, Hu, C] = Gain_H(x(i,1), x(i,2), x(i,3));
    yita_f(i) = yita;
    alpha_f(i) = alpha;
    T0_f(i) = T0;
    Hu_f(i) = Hu;
    C_f(i) = C;
end

% ����������Ӧ��
yita_fBest = yita_f;
alpha_fBest = alpha_f; 
T0_fBest = T0_f;
Hu_fBest = Hu_f; 
C_fBest = C_f;



%% ��ʼɸѡ���ӽ�
flj = [];  % ���ӽ�
fljx = [];  % ���ӽ��λ��
%����ʵ����Ⱦ���
tol = 1e-7;
for i = 1:x_size
    flag=0;  % ֧���־
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
    
    %�ж����ޱ�֧��
    flj_num = 0;
    if flag==0
        flj_num = flj_num+1;
        % ��¼���ӽ�
        flj(flj_num, 1) = yita_f(i);
        flj(flj_num, 2) = alpha_f(i);
        flj(flj_num, 3) = T0_f(i);
        flj(flj_num, 4) = Hu_f(i);
        flj(flj_num, 5) = C_f(i);
        % ���ӽ�λ��
        fljx(flj_num, :) = x(i, :); 
    end
end

%% ѭ������
for iter=1:max_lteration  
    % Ȩֵ����
    w = wmax - (wmax-wmin) * iter / max_lteration;  % �����������ŵ���Խ��ԽС
   
    % �ӷ��ӽ⼯�����ѡ��������Ϊȫ�����Ž�
    s = size(fljx,1);       
    index = randi(s,1,1);  
    g_best = fljx(index,:);

    %% Ⱥ�����
    for i=1:x_size
        % �ٶȸ���
        v(i,:)=w*v(i,:)+c1*rand(1,1)*(x_best(i,:)-x(i,:))+c2*rand(1,1)*(g_best-x(i,:));
        
        % λ�ø���
        x(i,:)=x(i,:)+v(i,:);
        % ����g h nԽ������
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
    
    %% ���������Ӧ��
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

    %% ����������ʷ���
    for i=1:x_size
        %���ڵ�֧��ԭ�еģ����ԭ�е�
        if( (yita_f(i)>90)||(yita_f(i)<85)...
                    ||(C_f(i)<0)...
                    ||(alpha_f(i)<0)||(alpha_f(i)>16)...
                    ||(T0_f(i)<0)...
                    ||((abs(Hu_f(i)-20)>abs(Hu_fPrior(i)-20))&&(abs(C_f(i)-0)>abs(C_fPrior(i)-0))) )
                x_best(i,:)=x(i,:);
        end
        %�˴˲���֧�䣬�������
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
                % ����Ŀ��ֵ
                yita_fBest(i)=yita_fPrior(i);
                alpha_fBest(i)=alpha_fPrior(i);
                T0_fBest(i)=T0_fPrior(i);
                Hu_fBest(i)=Hu_fPrior(i);
                C_fBest(i)=C_fPrior(i);
            end
        end
    end
    
    %% ���·��ӽ⼯��
    yita_f = yita_fBest;
    alpha_f = alpha_fBest;
    T0_f = T0_fBest;
    Hu_f = Hu_fBest;
    C_f = C_fBest;

    % �����������ӽ⼯��
    s=size(flj,1);  % Ŀǰ���ӽ⼯����Ԫ�ظ���
   
    %�Ƚ����ӽ⼯�Ϻ�xbest�ϲ�
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
    
    %ɸѡ���ӽ�
    flj=[];
    fljx=[];
    k = 0;
    tol=1e-7;
    for i=1:x_size+s
        flag = 0;  % û�б�֧��
        % �жϸõ��Ƿ����
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

        %�ж����ޱ�֧��
        if flag==0
            k = k + 1;
            flj(k, 1) = yita_f_b(i);
            flj(k, 2) = alpha_f_b(i);
            flj(k, 3) = T0_f_b(i);
            flj(k, 4) = Hu_f_b(i);
            flj(k, 5) = C_f_b(i);
            fljx(k,:) = xxbest(i,:);%���ӽ�λ��
        end
    end

    %ȥ���ظ�����
    repflag = 0;  % �ظ���־
    k = 1;  % ��ͬ���ӽ�������
    flj_new = [];  % �洢��ͬ���ӽ�
    fljx_new = [];  % �洢��ͬ���ӽ�����λ��
    flj_new(k,:) = flj(1,:);
    fljx_new(k,:) = fljx(1,:);
    for j=2:size(flj,1)
        repflag = 0;  % �ظ���־
        for i=1:size(flj_new, 1)
            result=(fljx(j,:)==fljx_new(i,:));
            if length(find(result==1))==dim
                repflag=1;  % ���ظ�
            end
        end
        %���Ӳ�ͬ���洢
        if repflag==0 
            k=k+1;
            flj_new(k,:)=flj(j,:);
            fljx_new(k,:)=fljx(j,:);
        end       
    end    
    %���ӽ����
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