%% 1、输入数据
%输入X的样本值
clear;clc;
x=[143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164]'; 
%插入\beta0对应列
X=[ones(16,1) x];
%输入Y的样本值
Y=[88 85 88 91 92 93 93 95 96 98 97 96 98 99 100 102]';

%% 2、回归分析及检验：
[b,bint,r,rint,stats]=regress(Y,X);    % regress函数用于回归分析

%regress(Y,X)函数返回值说明：
% b:回归系数，即回归直线的斜率
% bint:回归系数的置信区间
% r:R-squared，即回归模型的拟合优度
% rint:R-squared的置信区间
% stats:回归分析的统计量(决定系数)，包括F值、p值、无偏估计等
% 决定系数 :越接近1，拟合优度越好；越接近0，拟合优度越差。
% F值 : F值越大，线性关系越显著
% p值 : p值越小，拟合优度越好；p值越大，拟合优度越差。(F值对应的犯错的概率P值)
% 残差的方差

%输出我们需要的数据
b,bint,stats
%结果：
% b =
%   -16.0730
%     0.7194
% bint =
%   -33.7071    1.5612
%     0.6047    0.8340
% stats =
%     0.9282(决定系数)  180.9531(F值)    0.0000(P值)    1.7437(残差的标准误差)
% 即β_0=-16.073 ,β_1=0.7194; 
% β_0 的置信区间为[-33.7017 ,1.5612]，β_1 的置信区间为[0.6047 ,0.834]; 
% r_2=0.9282,F=180.9531,p=0.0000 
% 由p<0.05,可知回归模型 y=-16.073+0.7194x 成立

%% 3、残差分析，做残差图
rcoplot(r,rint)   %rcplot(r,rint)函数用于残差图
%rcoplot(r,rint)函数返回值说明：
% r:残差值
% rint:残差值的置信区间
% 图中红色的点为异常值，蓝色的点为正常值
% 图中红色的线为残差的置信区间，蓝色的线为残差的平均值
% 图中红色的点越多，说明异常值越多，模型的拟合优度越差
% 图中蓝色的点越多，说明正常值越多，模型的拟合优度越好
% 图中红色的线越长，说明残差的置信区间越大，模型的拟合优度越差
% 图中蓝色的线越短，说明残差的平均值越小，模型的拟合优度越好

%从残差图可以看出，除第二个数据外，其余数据的残差离
% 零点均较近，且残差的置信区间均包含零点，这说明回归模型
% y=-16.073+0.7194x能较好的符合原始数据，而第二个数据可视为异常点

% 4、预测及作图
z=b(1)+b(2)*x 
plot(x,Y,'k+',x,z,'r')

