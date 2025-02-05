%% 1、二次多项式回归
t = 1/30:1/30:14/30;  % 自变量 t
s = [11.86 15.67 20.6 26.69 33.71 41.93 51.13 61.49 72.9 85.44 99.08 113.77 129.54 146.48];  % 因变量 s
[p, S] = polyfit(t, s, 2);  % 进行二次多项式拟合

% 预测及作图
Y = polyconf(p, t, S);  % 计算拟合曲线的预测值
plot(t, s, 'k+', t, Y, 'r');  % 绘制原始数据点和拟合曲线   'k+' 表示黑色圆点    Y 表示红色拟合曲线
xlabel('t');  % 设置 x 轴标签
ylabel('s');  % 设置 y 轴标签
title('二次多项式回归');  % 设置图表标题
legend('原始数据', '拟合曲线');  % 设置图例

%% 2、化为多元线性回归
t = 1/30:1/30:14/30;  % 自变量 t
s = [11.86 15.67 20.6 26.69 33.71 41.93 51.13 61.49 72.9 85.44 99.08 113.77 129.54 146.48];  % 因变量 s
% 令x1=t, x2=t^2
T = [ones(14, 1), t', (t.^2)'];  % 构建多元线性回归的自变量矩阵
[b, bint, r, rint, stats] = regress(s', T);  % 进行多元线性回归分析





