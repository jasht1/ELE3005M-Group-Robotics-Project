robot = get_nyro_body();
positions = get_positions();
[qMat, ts] = plan_trajectory(robot, positions);

for i = 1:size(qMat, 1)
    show(robot, qMat(i, :)', 'PreservePlot', false);
    drawnow;
end
