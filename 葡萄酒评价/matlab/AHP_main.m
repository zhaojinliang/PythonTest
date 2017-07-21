clc;
clear;
[number,txt,raw]=xlsread('dataSet/decision_matrix.xlsx');
red_decision_matrix = number(1:10,:);  % 红葡萄酒评价决策矩阵
white_decision_matrix = number(12:21,:);  % 白葡萄酒评价决策矩阵
disp('红葡萄:');
red_AHP = AHP(red_decision_matrix);
disp('--------------------------------------------------------------------------------');
disp('白葡萄:');
white_AHP = AHP(white_decision_matrix);
