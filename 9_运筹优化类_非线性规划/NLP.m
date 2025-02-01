function firework_face()
    % 初始化窗口和参数
    figure('Color', 'k', 'Position', [100 100 800 600]);
    ax = axes('Color', 'k', 'XLim', [0 10], 'YLim', [0 10]);
    axis off equal
    
    % 烟花发射参数
    launch_pos = [5, 0];   % 发射起点
    target_pos = [5, 8];   % 爆炸位置
    rocket_points = gobjects(0);
    
    % ======== 第一阶段：烟花发射 ========
    % 生成随机轨迹点
    for i = 1:30
        theta = rand*2*pi;
        r = 0.2*rand;
        rocket_points(i) = line(ax, launch_pos(1)+r*cos(theta),...
                               launch_pos(2)+r*sin(theta),...
                               'Marker', '.', 'Color', [1 0.5 0],...
                               'MarkerSize', 15);
    end
    
    % 动画发射过程
    for t = 0:0.05:1
        new_pos = launch_pos + t*(target_pos - launch_pos);
        for i = 1:numel(rocket_points)
            offset = 0.3*[randn, randn];
            set(rocket_points(i), 'XData', new_pos(1)+offset(1),...
                                 'YData', new_pos(2)+offset(2));
        end
        drawnow
        pause(0.05)
    end
    
    % ======== 第二阶段：人脸爆炸 ========
    % 隐藏发射轨迹
    set(rocket_points, 'Visible', 'off')
    
    % 生成人脸数据（示例使用内置图像）
    load mandrill % MATLAB内置人脸数据
    [X, map] = ind2rgb(X, map);
    face_img = image(ax, [4 6], [7 9], X);
    set(face_img, 'AlphaData', 0) % 初始透明
    
    % 爆炸粒子效果
    [x,y] = meshgrid(linspace(4,6,20), linspace(7,9,20));
    scatter_points = scatter(ax, x(:), y(:), 30, [1 0.5 0], 'filled');
    
    % 动态显示爆炸过程
    for alpha = 0:0.05:1
        % 粒子扩散效果
        offsets = 0.3*randn(size(x(:)));
        set(scatter_points, 'XData', x(:)+offsets,...
                           'YData', y(:)+offsets,...
                           'SizeData', 30*(1-alpha))
        
        % 人脸渐显
        set(face_img, 'AlphaData', alpha)
        
        drawnow
        pause(0.05)
    end
    
    % 保持最终画面
    pause(2)
end





% function firework_face_custom()
%     % 初始化窗口和参数
%     figure('Color', 'k', 'Position', [100 100 800 600]);
%     ax = axes('Color', 'k', 'XLim', [0 10], 'YLim', [0 10]);
%     axis off equal
    
%     % 烟花发射参数
%     launch_pos = [5, 0];   % 发射起点
%     target_pos = [5, 8];   % 爆炸位置
%     rocket_points = gobjects(0);
    
%     % ======== 第一阶段：烟花发射 ========
%     % ...（与原始代码相同，此处省略）...

%     % ======== 第二阶段：人脸爆炸 ========
%     % 隐藏发射轨迹
%     set(rocket_points, 'Visible', 'off')
    
%     % 读取自定义图片（关键修改部分）
%     try
%         % 读取图像文件
%         img_path = 'D:\123.jpg'; % 注意路径斜杠方向
%         [custom_img, ~, alpha] = imread(img_path);
        
%         % 转换图像格式
%         if size(custom_img, 3) == 1 % 灰度图转RGB
%             custom_img = cat(3, custom_img, custom_img, custom_img);
%         end
%         custom_img = double(custom_img)/255; % 归一化
        
%         % 处理透明度通道
%         if isempty(alpha)
%             alpha = ones(size(custom_img,1), size(custom_img,2));
%         else
%             alpha = double(alpha)/255;
%         end
%     catch
%         error('图片加载失败，请检查路径和文件格式');
%     end

%     % 调整图像显示位置
%     img_width = 2;  % 图像显示宽度（根据坐标系范围调整）
%     img_height = size(custom_img,1)/size(custom_img,2)*img_width; % 保持比例
%     face_img = image(ax, [5-img_width/2, 5+img_width/2],...
%                       [8-img_height/2, 8+img_height/2],...
%                       custom_img);
%     set(face_img, 'AlphaData', 0) % 初始透明

%     % 爆炸粒子效果（保持与图像中心对齐）
%     [x,y] = meshgrid(linspace(5-img_width/2,5+img_width/2,20),...
%                      linspace(8-img_height/2,8+img_height/2,20));
%     scatter_points = scatter(ax, x(:), y(:), 30, [1 0.5 0], 'filled');
    
%     % 动态显示爆炸过程（与原始代码相同）
%     % ...（后续动画代码保持不变）...
% end
% 关键修改说明：
% 路径设置：

% matlab
% 复制
% img_path = 'D:\123.jpg'; % 注意使用反斜杠
% 确保文件确实存在且为常见图片格式（jpg/png/bmp等）

% 图像预处理：

% 自动处理灰度图/彩色图

% 数值归一化到[0,1]范围

% 自动处理透明度通道（支持png透明图层）

% 比例适配：

% matlab
% 复制
% img_width = 2; % 根据坐标系范围调整
% img_height = size(custom_img,1)/size(custom_img,2)*img_width;
% 自动计算高度以保持原始比例

% 显示定位：

% matlab
% 复制
% [5-img_width/2, 5+img_width/2] % X轴居中显示
% [8-img_height/2, 8+img_height/2] % Y轴对齐爆炸点
% 适配建议：
% 图片选择：

% 推荐使用正方形图片（避免变形）

% 分辨率不宜过高（建议1000x1000以内）

% 效果优化：

% matlab
% 复制
% % 在图像显示后添加锐化处理（可选）
% sharpened = imsharpen(custom_img);
% set(face_img, 'CData', sharpened);
% 故障排除：

% 如果显示位置偏移：调整img_width值和爆炸点坐标

% 如果颜色异常：检查原始图片是否为RGB格式

% 如果显示模糊：增加meshgrid的密度（修改20为更大数值）

% 完整代码需要结合原始动画部分（已标注省略处需保留原有实现），修改后的代码将实现：

% 从指定路径加载用户自定义图片

% 自动适配图像比例和显示位置

% 保持原有粒子动画效果

% 支持带透明通道的PNG图片

% 建议将代码保存为.m文件后运行，观察效果后根据实际显示情况微调参数。
















