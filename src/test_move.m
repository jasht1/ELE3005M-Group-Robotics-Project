robot = get_nyro_body;

% Test Position (Cartesian)
pos = [0.15 0.15 0.005];

% Test Angles (Euler)
angles = [0 0 0];

% Ajustable Weights
weights = [0 1 1 1 1 1];

configSoln = get_new_pose(robot, pos, angles, weights);

figure;
show(robot,configSoln,PreservePlot=false);
axis tight;
