function [lnp]=mylog(p)
    n=length(p); %计算向量的长度
    lnp=zeros(n,1);   %初始化lnp为0
    for i=1:n
        if p(i)==0   %如果p(i)为0，则lnp(i)为0
            lnp(i)=0;
        else
            lnp(i)=log(p(i));
        end
    end
end
