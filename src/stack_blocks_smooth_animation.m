robot = get_nyro_body();
positions = get_positions();
[qMat, ts] = plan_trajectory(robot, positions);

% for i = 1:size(qMat, 1)
%     config = homeConfiguration(robot);
%     for j = 1:numel(config)
%         config(j) = qMat(i, j);
%     end
%     show(robot, config, 'PreservePlot', false, 'Frames', 'on');
%     xlim([-0.1, 0.4]);
%     ylim([-0.3, 0.3]);
%     zlim([0, 0.5]);
%     drawnow;
% end

function animate_trajectory(robot, qMat, save)
    % Set plot limits
    xLimits = [-0.1, 0.4];
    yLimits = [-0.3, 0.3];
    zLimits = [0, 0.5];
    
    % GIF settings
    gifFilename = 'Exports/stack_blocks_smooth_animation.gif';
    delayTime = 1/30; % 30 fps
    
    if save
        figure('Visible', 'off');
    else
        figure('Visible', 'on');
    end

    for i = 1:size(qMat, 1)
        config = homeConfiguration(robot);
        for j = 1:numel(config)
            config(j) = qMat(i, j);
        end

        show(robot, config,'PreservePlot', false,'Frames', 'on');
        xlim(xLimits);
        ylim(yLimits);
        zlim(zLimits);
        view(135, 20);
        drawnow;

        if save
            frame = getframe(gcf);
            im = frame2im(frame);
            [A, map] = rgb2ind(im, 256);

            if i == 1
                imwrite(A, map, gifFilename,'gif', 'LoopCount', Inf, 'DelayTime', delayTime);
            else
                imwrite(A, map, gifFilename,'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
            end
        end
    end

    if save
        fprintf('Animation saved to %s\n', gifFilename);
    end
end

animate_trajectory(robot, qMat, true)

