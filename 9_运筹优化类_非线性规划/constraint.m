function [g,k] = constraint(x)
% 不等式约束条件
% sum(x(:,1:6),2)是对矩阵前6列按行求和，即对前6个元素求和，
% 对应6个工地接收第一个料场的总量。再减去20，即把不等式右边常数项移到左边
g = [sum(x(:,1:6),2)-20    
     sum(x(:,7:12),2)-20
    ];
% 等式约束条件,6个工地从两个料场收到的总量分别为3,5,4,7,6,11
k = [x(1)+x(7)-3
     x(2)+x(8)-5
     x(3)+x(9)-4
     x(4)+x(10)-7
     x(5)+x(11)-6
     x(6)+x(12)-11
    ];
end






