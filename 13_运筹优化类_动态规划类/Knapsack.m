function max_value = knapsack(weights, values, capacity)
    % �������0-1�������������ֵ
    % weights: ��Ʒ����������
    % values: ��Ʒ�ļ�ֵ����
    % capacity: ����������
    % max_value: ����ֵ

    n = length(weights); % ��Ʒ����
    dp = zeros(n + 1, capacity + 1); % ��ʼ����̬�滮����

    % ��̬�滮������
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

% ��ȡ�û�����
w = input('��������Ʒ�������б��ö��ŷָ���', 's');
v = input('��������Ʒ�ļ�ֵ�б��ö��ŷָ���', 's');
c = input('�����뱳����������');

% ��������ַ���ת��Ϊ��������
weights = str2num(strsplit(w, ','));
values = str2num(strsplit(v, ','));

% ���ú�������ʾ���
res = knapsack(weights, values, c);
fprintf('����ֵΪ: %d\n', res);
