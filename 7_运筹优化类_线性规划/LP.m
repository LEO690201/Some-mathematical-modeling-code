f = [-20 ;-30 ;-45]; 
A = [4 ,8 ,15;1 ,1 ,1;]; 
b = [100 ;20];
lb = zeros(3 ,1);
[x,fval] = linprog(f ,A ,b ,[] ,[] ,lb) %没有等号约束
y = -fval  %目标函数为最大化
disp('A、B、C三图分别通关的次数为：')
disp(x)
disp('最终获得的经验为：')
disp(y)




