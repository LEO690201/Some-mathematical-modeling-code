%% ��ȡ�û�����Ľ��
n=input('�������')
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


%% ��̬�滮
n=input('�������')
n=round(n);
res=coinChange(n);
disp(res);

function res=coinChange(n)
    % ��ʼ��
    dp=Inf(1,n+1);
    %������Ϊ0ʱҪ0öӲ��
    dp(1)=0;
    for i=1:n
        % ��������ڵ���2
        if i>=2
            dp(i+1)=min(dp(i+1),dp(i-2+1)+1);
        end
        % ��������ڵ���5
        if i>=5
            dp(i+1)=min(dp(i+1),dp(i-5+1));
        end
        % ��������ڵ���7
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








