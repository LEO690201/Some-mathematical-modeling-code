function max_value = knapsack(weights, values, capacity)
    % 用于求解0-1背包问题的最大价值
    % weights: 物品的重量数组
    % values: 物品的价值数组
    % capacity: 背包的容量
    % max_value: 最大价值

    n = length(weights); % 物品数量
    dp = zeros(n + 1, capacity + 1); % 初始化动态规划数组

    % 动态规划求解过程
    for i = 1:n
        for j = 1:capacity
            if j < weights(i)
                dp(i+1, j+1) = dp(i, j+1);
            else
                dp(i+1, j+1) = max(dp(i, j+1), dp(i, j+1 - weights(i)) + values(i));
            end
        end
    end
    max_value = dp(n+1, capacity+1);
end

% 获取用户输入
w = input('请输入物品的重量列表，用逗号分隔：', 's');
v = input('请输入物品的价值列表，用逗号分隔：', 's');
c = input('请输入背包的容量：');

% 将输入的字符串转换为整数数组
weights = str2num(strsplit(w, ','));
values = str2num(strsplit(v, ','));

% 调用函数并显示结果
res = knapsack(weights, values, c);
fprintf('最大价值为: %d\n', res);
