robot = get_nyro_body();
positions = get_positions();
[qMat, ts] = plan_trajectory(robot, positions);

function animate_trajectory(robot, qMat, save)
    if save
        v = VideoWriter(videoFilename, 'Motion JPEG AVI'); %use MPEG-4 if u use win
        v.Quality = 100;
        v.FrameRate = fps;
        open(v);
        showfig = 'off'
    else
        showfig = 'on'
    end

    % Set plot limits
    xLimits = [-0.1, 0.4];
    yLimits = [-0.3, 0.3];
    zLimits = [0, 0.5];
    viewport = [90, 20];

    % Video settings
    videoFilename = 'Exports/stack_blocks_smooth_animation';
    fps = 30;
    fig = figure('Visible', showfig, 'Position', [100, 100, 1920, 1080]);

    for i = 1:size(qMat, 1)
        config = homeConfiguration(robot);
        for j = 1:numel(config)
            config(j) = qMat(i, j);
        end

        show(robot, config, 'PreservePlot', false, 'Frames', 'on');
        xlim(xLimits);
        ylim(yLimits);
        zlim(zLimits);
        view(viewport);
        drawnow;

        if save
            frame = getframe(fig);
            writeVideo(v, frame);
        end
    end

    if save
        close(v);
        fprintf('Animation saved to %s\n', videoFilename);
    end
end

animate_trajectory(robot, qMat, true)

