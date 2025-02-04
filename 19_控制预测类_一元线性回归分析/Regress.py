import numpy as np  # 导入 numpy 库用于数值计算
import statsmodels.api as sm  # 导入 statsmodels 库用于回归分析
import matplotlib.pyplot as plt  # 导入 matplotlib 库用于绘图

# 1. 输入数据
# 输入 X 的样本值
x = np.array([143, 145, 146, 147, 149, 150, 153, 154, 155, 156, 157, 158, 159, 160, 162, 164])
# 插入 β0 对应列（截距项）
X = sm.add_constant(x)  # 在 x 中添加常数列（截距项），用于表示 β0
# 输入 Y 的样本值
Y = np.array([88, 85, 88, 91, 92, 93, 93, 95, 96, 98, 97, 96, 98, 99, 100, 102])

# 2. 回归分析及检验
model = sm.OLS(Y, X)  # 定义线性回归模型，使用最小二乘法（OLS）
results = model.fit()  # 拟合模型，计算回归系数等统计量
# model.fit()函数返回一个包含回归分析结果的对象，包括拟合参数、标准误差、t检验值、p值等。

# 输出我们需要的数据
print("回归系数 (b):")  # 输出回归系数
print(results.params)  # results.params 包含截距项 β0 和斜率 β1(Matlab中的b--回归系数)
print("回归系数的置信区间 (bint):")  # 输出回归系数的置信区间
print(results.conf_int())  # results.conf_int() 返回每个系数的置信区间(Matlab中的bint)
print("统计量 (stats):")
print("R-squared:", results.rsquared)  # 输出 R-squared 值，表示模型的解释力(Matlab中的r,拟合优度)
print("F-statistic:", results.fvalue)  # 输出 F 统计量，用于检验模型的整体显著性(Matlab中的F)
print("p-value:", results.f_pvalue)  # 输出 p 值，用于判断模型是否显著(Matlab中的p)
print("Residual variance:", results.mse_resid)  # 输出残差方差
print("Residual standard error:", np.sqrt(results.mse_resid))  # 输出残差标准误差
print(results.summary())    # 输出回归分析结果的摘要信息

# 3. 残差分析，做残差图
residuals = results.resid  # 获取残差（实际值与预测值的差异）
residual_std_error = np.sqrt(results.mse_resid)  # 计算残差的标准误差

fig, ax = plt.subplots()  # 创建绘图对象       subplots()函数返回一个包含 figure 和 axes 对象的元组
ax.axhline(y=0, color='k', linestyle='--')  # 添加零线，表示残差为零的位置
# 绘制残差及其置信区间
ax.errorbar(x, residuals, yerr=residual_std_error, fmt='o', capsize=5)  
#fmt表示点的形状，capsize表示误差线的宽度
ax.set_xlabel('X')  # 设置 x 轴标签
ax.set_ylabel('Residuals')  # 设置 y 轴标签
ax.set_title('Residual Plot')  # 设置图表标题
plt.show()  # 显示残差图

# 4. 预测及作图
z = results.predict(X)  # 使用拟合的模型进行预测，得到预测值
plt.plot(x, Y, 'k+', label='实际值')  # 绘制实际值，使用黑色加号标记
plt.plot(x, z, 'r-', label='拟合值')  # 绘制拟合值，使用红色实线
plt.xlabel('X')  # 设置 x 轴标签
plt.ylabel('Y')  # 设置 y 轴标签
plt.title('回归分析结果')  # 设置图表标题
plt.legend()  # 添加图例
plt.show()  # 显示回归分析结果图


# result.summary()  # 输出回归分析结果的摘要信息
# result.params  # 回归系数                         (matlab中的b,表示斜率)
# result.conf_int()  # 回归系数的置信区间            (matlab中的bint,表示斜率的置信区间)
# result.rsquared  # R-squared 值                  (拟合优度,表示模型的解释力)
# result.fvalue  # F 统计量                         (F值越大，线性关系越显著)
# result.f_pvalue  # p 值                             (p值越小，线性关系越显著)
# result.mse_resid  # 残差方差                       (残差方差越小，残差越接近正态分布)
# np.sqrt(result.mse_resid)  # 残差标准误差          (残差标准误差越小，残差越接近正态分布)
# result.resid  # 残差                             (实际值与预测值的差异)
# result.predict(X)  # 预测值                         (使用拟合的模型进行预测)

