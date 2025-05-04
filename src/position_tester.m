clear all; close all;

robot = get_nyro_body();
show(robot)
axis tight

% pos = [0.30 0 0.3];
% pos = [0.15 0.15 0.025];
% pos = [0.2 0.18 0.1];
% pos = [0.2 0.18 0.0001];
% pos = [0.25 0.16 0.1];
% pos = [0.25 0.16 0.0001];
% pos = [0.2 -0.18 0.1];
% pos = [0.2 -0.18 0.008];
% pos = [0.2 -0.18 (0.008+0.01)];
pos = [0.2 -0.18 (0.008+0.01+0.01)];

ros = [1.5*pi,pi,0];
poseTF = trvec2tform(pos)*eul2tform(ros);

hold on
plotTransforms(pos,eul2quat([0 0 0]),FrameSize=0.1);

weights = [0.9 0.9 0.9 1 1 1];
pose = get_new_pose(robot,pos,ros,weights);

figure
show(robot,pose,PreservePlot=false)
axis tight

print_pose(pose)
