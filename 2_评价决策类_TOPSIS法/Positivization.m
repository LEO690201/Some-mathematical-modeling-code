%Positivization函数文件
%function [输出变量]=函数名称(输入变量)
%函数中间部分都是函数体
%函数最后要用end结尾
%输出变量和输入变量可以有很多个,用逗号隔开
%例如:
%function [输出变量1,输出变量2]=函数名称(输入变量1,输入变量2)
%    代码块1
%    代码块2
%    代码块3
%end

function [posit_x]=Positivization(x,type,i)
% 输入变量有三个
%x:需要正向化处理的指标对应原始向量
%type:正向化处理的类型,1:极小型,2:中间型,3:区间型
%i:正向化处理的列号
%输出变量posit_x表示:正向化后的列向量
    if type==1    %极小型
        disp(['第' num2str(i) '列正在采用采用极小型正向化'])
        posit_x=Min2Max(x);    %调用Min2Max函数进行正向化
        disp(['第' num2str(i) '列极小型正向化完成'])
        disp('~~~~~~~~~~~~~~~~~~~~~分界线~~~~~~~~~~~~~~~~~~~~~~')
    elseif type==2    %中间型
        disp(['第' num2str(i) '列正在采用采用中间型正向化'])
        best=input('请输入最佳的那一个值:  ');    %输入最佳值
        posit_x=Mid2Max(x,best);    %调用Mid2Max函数进行正向化
        disp(['第' num2str(i) '列中间型正向化完成'])
        disp('~~~~~~~~~~~~~~~~~~~~~分界线~~~~~~~~~~~~~~~~~~~~~~')
    elseif type==3    %区间型
        disp(['第' num2str(i) '列正在采用采用区间型正向化'])
        a=input('请输入区间的下界:  ');
        b=input('请输入区间的上界:  ');    
        posit_x=Inter2Max(x,a,b);    %调用Int2Max函数进行正向化
        disp(['第' num2str(i) '列区间型正向化完成'])
        disp('~~~~~~~~~~~~~~~~~~~~~分界线~~~~~~~~~~~~~~~~~~~~~~')
    else
        disp('没有这种类型的指标,请检查Type向量中是否有除了1,2,3以外的数字')
    end
end









