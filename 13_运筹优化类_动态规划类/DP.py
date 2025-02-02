# 硬币问题
# 递归算法
def f(x):
    """
    递归函数，用于计算找零的最少硬币数。
    参数x：找零的金额
    返回值：最少硬币数量，如果无法找零，则返回无穷大
    """
    if x == 0:
        return 0  # 如果找零金额为 0，则不需要任何硬币，直接返回 0
    res = float('inf')  # 用一个很大的数表示无穷大，用于比较最小值
    if x >= 2:
        # 如果找零金额大于等于 2 元，尝试使用一枚 2 元硬币
        res = min(f(x - 2) + 1, res)  # 递归调用 f 函数，并加上这一枚硬币
    if x >= 5:
        # 如果找零金额大于等于 5 元，尝试使用一枚 5 元硬币
        res = min(f(x - 5) + 1, res)  # 递归调用 f 函数，并加上这一枚硬币
    if x >= 7:
        # 如果找零金额大于等于 7 元，尝试使用一枚 7 元硬币
        res = min(f(x - 7) + 1, res)  # 递归调用 f 函数，并加上这一枚硬币
    return res  # 返回最少硬币数量，如果无法找零，则返回无穷大
n=int(input('请输入要拼的金额：'))
res=f(n)
print(res)


# 找零
def coinChange(n):
    """
    用于计算找零的最少硬币数。
    参数n：要找零的金额
    返回值：最少硬币数量，如果无法找零，则返回-1
    """
    dp = [float('inf')] * (n + 1)  # 初始化动态规划数组
    dp[0] = 0  # 找零金额为 0 时，需要 0 枚硬币
    for i in range(1, n + 1):
        if i >= 2:
            dp[i] = min(dp[i], dp[i - 2] + 1)
        if i >= 5:
            dp[i] = min(dp[i], dp[i - 5] + 1)
        if i >= 7:
            dp[i] = min(dp[i], dp[i - 7] + 1)
    if dp[n] != float('inf'):
        return dp[n]
    else:
        return -1
n=int(input('请输入要拼的金额：'))
res=coinChange(n)
print(res)









# 背包问题

def knapsack(weights, values, capacity):
    """
    用于求解0-1背包问题的最大价值
    参数weights：物品的重量列表
    参数values：物品的价值列表
    参数capacity：背包的容量
    返回值：最大价值
    """
    n = len(weights)  # 物品数量
    dp = [[0 for j in range(capacity + 1)] for i in range(n + 1)]  # 初始化动态规划数组

    # 动态规划求解过程
    for i in range(1, n + 1):
        for j in range(1, capacity + 1):
            if j < weights[i - 1]:  # 背包容量小于当前物品重量，不能选择当前物品
                dp[i][j] = dp[i - 1][j]
            else:  # 能选择当前物品，要选择价值更大的方案
                dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weights[i - 1]] + values[i - 1])
    return dp[n][capacity]
w = input('请输入物品的重量列表，用逗号分隔：')
v = input('请输入物品的价值列表，用逗号分隔：')
c = int(input('请输入背包的容量：'))
weights = [int(x) for x in w.split(',')]  # 将输入的字符串转换为整数列表
values = [int(x) for x in v.split(',')]
res = knapsack(weights, values, c)
print('最大价值为:', res)
