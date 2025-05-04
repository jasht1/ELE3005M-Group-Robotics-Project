run nyro_body

show(robot);
axis tight;

pos = [0.15 0.15 0.005];
angles = [0 0 0];
weights = [0 1 1 1 1 1];

configSoln = target_move(robot, pos, angles, weights);

figure;
show(robot,configSoln,PreservePlot=false);
axis tight;
