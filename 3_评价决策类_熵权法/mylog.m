function [lnp]=mylog(p)
    n=length(p); %���������ĳ���
    lnp=zeros(n,1);   %��ʼ��lnpΪ0
    for i=1:n
        if p(i)==0   %���p(i)Ϊ0����lnp(i)Ϊ0
            lnp(i)=0;
        else
            lnp(i)=log(p(i));
        end
    end
end
