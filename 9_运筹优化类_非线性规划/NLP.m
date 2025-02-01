function firework_face()
    % ��ʼ�����ںͲ���
    figure('Color', 'k', 'Position', [100 100 800 600]);
    ax = axes('Color', 'k', 'XLim', [0 10], 'YLim', [0 10]);
    axis off equal
    
    % �̻��������
    launch_pos = [5, 0];   % �������
    target_pos = [5, 8];   % ��ըλ��
    rocket_points = gobjects(0);
    
    % ======== ��һ�׶Σ��̻����� ========
    % ��������켣��
    for i = 1:30
        theta = rand*2*pi;
        r = 0.2*rand;
        rocket_points(i) = line(ax, launch_pos(1)+r*cos(theta),...
                               launch_pos(2)+r*sin(theta),...
                               'Marker', '.', 'Color', [1 0.5 0],...
                               'MarkerSize', 15);
    end
    
    % �����������
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
    
    % ======== �ڶ��׶Σ�������ը ========
    % ���ط���켣
    set(rocket_points, 'Visible', 'off')
    
    % �����������ݣ�ʾ��ʹ������ͼ��
    load mandrill % MATLAB������������
    [X, map] = ind2rgb(X, map);
    face_img = image(ax, [4 6], [7 9], X);
    set(face_img, 'AlphaData', 0) % ��ʼ͸��
    
    % ��ը����Ч��
    [x,y] = meshgrid(linspace(4,6,20), linspace(7,9,20));
    scatter_points = scatter(ax, x(:), y(:), 30, [1 0.5 0], 'filled');
    
    % ��̬��ʾ��ը����
    for alpha = 0:0.05:1
        % ������ɢЧ��
        offsets = 0.3*randn(size(x(:)));
        set(scatter_points, 'XData', x(:)+offsets,...
                           'YData', y(:)+offsets,...
                           'SizeData', 30*(1-alpha))
        
        % ��������
        set(face_img, 'AlphaData', alpha)
        
        drawnow
        pause(0.05)
    end
    
    % �������ջ���
    pause(2)
end





% function firework_face_custom()
%     % ��ʼ�����ںͲ���
%     figure('Color', 'k', 'Position', [100 100 800 600]);
%     ax = axes('Color', 'k', 'XLim', [0 10], 'YLim', [0 10]);
%     axis off equal
    
%     % �̻��������
%     launch_pos = [5, 0];   % �������
%     target_pos = [5, 8];   % ��ըλ��
%     rocket_points = gobjects(0);
    
%     % ======== ��һ�׶Σ��̻����� ========
%     % ...����ԭʼ������ͬ���˴�ʡ�ԣ�...

%     % ======== �ڶ��׶Σ�������ը ========
%     % ���ط���켣
%     set(rocket_points, 'Visible', 'off')
    
%     % ��ȡ�Զ���ͼƬ���ؼ��޸Ĳ��֣�
%     try
%         % ��ȡͼ���ļ�
%         img_path = 'D:\123.jpg'; % ע��·��б�ܷ���
%         [custom_img, ~, alpha] = imread(img_path);
        
%         % ת��ͼ���ʽ
%         if size(custom_img, 3) == 1 % �Ҷ�ͼתRGB
%             custom_img = cat(3, custom_img, custom_img, custom_img);
%         end
%         custom_img = double(custom_img)/255; % ��һ��
        
%         % ����͸����ͨ��
%         if isempty(alpha)
%             alpha = ones(size(custom_img,1), size(custom_img,2));
%         else
%             alpha = double(alpha)/255;
%         end
%     catch
%         error('ͼƬ����ʧ�ܣ�����·�����ļ���ʽ');
%     end

%     % ����ͼ����ʾλ��
%     img_width = 2;  % ͼ����ʾ��ȣ���������ϵ��Χ������
%     img_height = size(custom_img,1)/size(custom_img,2)*img_width; % ���ֱ���
%     face_img = image(ax, [5-img_width/2, 5+img_width/2],...
%                       [8-img_height/2, 8+img_height/2],...
%                       custom_img);
%     set(face_img, 'AlphaData', 0) % ��ʼ͸��

%     % ��ը����Ч����������ͼ�����Ķ��룩
%     [x,y] = meshgrid(linspace(5-img_width/2,5+img_width/2,20),...
%                      linspace(8-img_height/2,8+img_height/2,20));
%     scatter_points = scatter(ax, x(:), y(:), 30, [1 0.5 0], 'filled');
    
%     % ��̬��ʾ��ը���̣���ԭʼ������ͬ��
%     % ...�������������뱣�ֲ��䣩...
% end
% �ؼ��޸�˵����
% ·�����ã�

% matlab
% ����
% img_path = 'D:\123.jpg'; % ע��ʹ�÷�б��
% ȷ���ļ�ȷʵ������Ϊ����ͼƬ��ʽ��jpg/png/bmp�ȣ�

% ͼ��Ԥ����

% �Զ�����Ҷ�ͼ/��ɫͼ

% ��ֵ��һ����[0,1]��Χ

% �Զ�����͸����ͨ����֧��png͸��ͼ�㣩

% �������䣺

% matlab
% ����
% img_width = 2; % ��������ϵ��Χ����
% img_height = size(custom_img,1)/size(custom_img,2)*img_width;
% �Զ�����߶��Ա���ԭʼ����

% ��ʾ��λ��

% matlab
% ����
% [5-img_width/2, 5+img_width/2] % X�������ʾ
% [8-img_height/2, 8+img_height/2] % Y����뱬ը��
% ���佨�飺
% ͼƬѡ��

% �Ƽ�ʹ��������ͼƬ��������Σ�

% �ֱ��ʲ��˹��ߣ�����1000x1000���ڣ�

% Ч���Ż���

% matlab
% ����
% % ��ͼ����ʾ������񻯴�����ѡ��
% sharpened = imsharpen(custom_img);
% set(face_img, 'CData', sharpened);
% �����ų���

% �����ʾλ��ƫ�ƣ�����img_widthֵ�ͱ�ը������

% �����ɫ�쳣�����ԭʼͼƬ�Ƿ�ΪRGB��ʽ

% �����ʾģ��������meshgrid���ܶȣ��޸�20Ϊ������ֵ��

% ����������Ҫ���ԭʼ�������֣��ѱ�עʡ�Դ��豣��ԭ��ʵ�֣����޸ĺ�Ĵ��뽫ʵ�֣�

% ��ָ��·�������û��Զ���ͼƬ

% �Զ�����ͼ���������ʾλ��

% ����ԭ�����Ӷ���Ч��

% ֧�ִ�͸��ͨ����PNGͼƬ

% ���齫���뱣��Ϊ.m�ļ������У��۲�Ч�������ʵ����ʾ���΢��������
















