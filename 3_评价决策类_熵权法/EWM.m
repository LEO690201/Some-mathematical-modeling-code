%% 1.对正向化之后的矩阵进行标准化
% X=[9 0 0 0;8 3 0.9 0.5;6 7 0.2 1]
X=input('指标矩阵X=');
[n,m]=size(X);
Z=X./repmat(sum(X.*X).^0.5,n,1);
disp('标准化后的矩阵Z=')
disp(Z)

%% 2.计算熵权
D=zeros(1,m); %初始化保存信息效用值的行向量
for i=1:m
    x=Z(:,i);  %去除第i列的指标
    p=x/sum(x);
    %注意:p有可能是0,计算log(p)时,会返回NAN,所以自己定义函数
    e=-sum(p.*mylog(p)/log(n)); %计算信息熵
    D(i)=1-e; %信息效用值
end
W=D./sum(D);  %将信息效用值归一化,得到权重
disp('权重矩阵W=')
disp(W)

%% 3.计算加权指标
Y=Z.*repmat(W,n,1);  %计算加权指标
disp('加权指标矩阵Y=')
disp(sum(Y,2))  %求和,得到各个指标的加权值

