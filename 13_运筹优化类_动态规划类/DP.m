%% 获取用户输入的金额
n=input('请输入金额：')
n=round(n);
res=f(n);
disp(res);



function res=f(x)
    if x==0
        res=0
    else
        res=Inf;
        if x>=2
            res=min(f(x-2)+1,res);
        end
        if x>=5
            res=min(f(x-5)+1,res);
        end
        if x>=7
            res=min(f(x-7)+1,res);
        end
    end
end


%% 动态规划
n=input('请输入金额：')
n=round(n);
res=coinChange(n);
disp(res);

function res=coinChange(n)
    % 初始化
    dp=Inf(1,n+1);
    %找零金额为0时要0枚硬币
    dp(1)=0;
    for i=1:n
        % 如果金额大于等于2
        if i>=2
            dp(i+1)=min(dp(i+1),dp(i-2+1)+1);
        end
        % 如果金额大于等于5
        if i>=5
            dp(i+1)=min(dp(i+1),dp(i-5+1));
        end
        % 如果金额大于等于7
        if i>=7
            dp(i+1)=min(dp(i+1),dp(i-7+1));
        end
    end
    if dp(n+1)~=Inf
        res=dp(n+1);
    else
        res+-1;
    end
    

end








