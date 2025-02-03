import math, json
import matplotlib.pyplot as plt

# 计算路径长度的函数
def calc(route, points):
    N = len(route)  # 路径中点的数量
    l = 0  # 初始化路径长度为 0
    # 计算路径中相邻点之间的距离并累加
    for i in range(N - 1):
        l += math.sqrt(
            (points[route[i + 1]][0] - points[route[i]][0]) ** 2 + 
            (points[route[i + 1]][1] - points[route[i]][1]) ** 2
        )                    # points函数用于获取坐标
    # 计算从最后一个点回到起点的距离并累加
    l += math.sqrt(
        (points[route[0]][0] - points[route[-1]][0]) ** 2 + 
        (points[route[0]][1] - points[route[-1]][1]) ** 2
    )
    return l  # 返回路径的总长度

# 绘制路径的函数
def plot_ans(route, points):
    x = []  # 用于存储路径中点的 x 坐标
    y = []  # 用于存储路径中点的 y 坐标
    # 遍历路径中的点，提取其坐标
    for i in route:
        x.append(points[i][0])
        y.append(points[i][1])
    # 将起点的坐标加入路径的末尾，形成闭合路径
    x.append(points[route[0]][0])
    y.append(points[route[0]][1])
    # 绘制路径
    plt.plot(x, y)
    plt.show()  # 显示绘制的路径

# 贪婪算法求解旅行商问题（TSP）的函数
def greedy(start, points):
    N = len(points)  # 点的数量
    visited = [False] * N  # 初始化访问标记数组，所有点均未访问
    visited[start] = True  # 标记起点为已访问
    ans = [start]  # 初始化路径，起点加入路径

    # 构建路径
    for i in range(N - 1):  # 遍历 N-1 次，找到所有点
        nxt = 0  # 初始化下一个点的索引
        min_len = 1e9  # 初始化最小距离为一个很大的数
        # 遍历所有点，找到未访问的最近点
        for j in range(N):
            if not visited[j]:  # 如果点 j 未访问
                l = math.sqrt(
                    (points[ans[-1]][0] - points[j][0]) ** 2 + 
                    (points[ans[-1]][1] - points[j][1]) ** 2
                )  # 计算当前点到点 j 的距离
                if l < min_len:  # 如果该距离小于当前最小距离
                    nxt = j  # 更新下一个点的索引
                    min_len = l  # 更新最小距离
        ans.append(nxt)  # 将下一个点加入路径
        visited[nxt] = True  # 标记该点为已访问
    # ans.append(start)  # 如果需要形成闭合路径，可以取消注释这一行
    return ans  # 返回构建的路径