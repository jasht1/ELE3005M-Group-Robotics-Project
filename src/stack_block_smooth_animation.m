robot = get_nyro_body();
positions = get_positions();
[qMat, ts] = plan_trajectory(robot, positions);

for i = 1:size(qMat, 1)
    config = homeConfiguration(robot);
    for j = 1:numel(config)
        config(j) = qMat(i, j);
    end
    show(robot, config, 'PreservePlot', false);
    drawnow;
end
