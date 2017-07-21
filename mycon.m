function [c,ceq]=mycon(x)
c=(x(1)-1)^2-x(2);
ceq=[];  %无等式约束

% fun='x(1)^2+x(2)^2-x(1)*x(2)-2*x(1)-5*x(2)';%目标函数
% x0=[0 1];
% A=[-2 3];%线性不等式约束
% b=6;
% Aeq=[];%无限性等式约束
% beq=[];
% lb=[];%没有上下界
% ub=[];
% [x,fval,exitflag,output,lambda,grad,hessian]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,@mycon)
% 
% Local minimum found that satisfies the constraints.
% 
% Optimization completed because the objective function is non-decreasing in 
% feasible directions, to within the default value of the optimality tolerance,
% and constraints are satisfied to within the default value of the constraint tolerance.
% 
% <stopping criteria details>
% 
% 
% x =
% 
%     2.9994    3.9992
% 
% 
% fval =
% 
%   -13.0000
% 
% 
% exitflag =
% 
%      1
% 
% 
% output = 
% 
%          iterations: 16
%           funcCount: 52
%     constrviolation: 0
%            stepsize: 4.1550e-04
%           algorithm: 'interior-point'
%       firstorderopt: 4.9398e-07
%        cgiterations: 0
%             message: 'Local minimum found that satisfies the constraints.…'
% 
% 
% lambda = 
% 
%          eqlin: [0x1 double]
%       eqnonlin: [0x1 double]
%        ineqlin: 4.2620e-04
%          lower: [2x1 double]
%          upper: [2x1 double]
%     ineqnonlin: 3.1145e-04
% 
% 
% grad =
% 
%    1.0e-03 *
% 
%    -0.3929
%    -0.9675
% 
% 
% hessian =
% 
%     2.1345   -1.0989
%    -1.0989    2.0728