
robot = get_nyro_body;
positions = get_positions();
eulAngles = [1.5*pi,pi,0]; % End efector down
weights = [0.9 0.9 0.9 1 1 1]; % IK weights
% numPoints = size(positions, 1);
initialGuess = homeConfiguration(robot);

posNames = [
  "Middle";
  "Block 1";
  "Block 2";
  "Block 3";
  "Stack 1";
  "Stack 2";
  "Stack 3";
  ];
posPoints = [
  positions(1, :);
  positions(3, :);
  positions(9, :);
  positions(17, :);
  positions(6, :);
  positions(13, :);
  positions(20, :);
  ];
% showPositions = dictionary(posNames,posPoints)
% numPoints = size(showPositions, 1);
numPoints = size(posPoints, 1);

for i = 1:numPoints 
  % position = positions(i, :);
  position = posPoints(i,:);
  pose = get_new_pose(robot,position,eulAngles,weights,initialGuess);
  figure;
  show(robot,pose,PreservePlot=false);
  titlename = posNames(i);
  title(titlename);
  axis tight;
  initialGuess = pose; % start from prev pose
end

% pos = [0.30 0 0.3];
% pos = [0.15 0.15 0.025];
% pos = [0.2 0.18 0.1];
% pos = [0.2 0.18 0.0001];
% pos = [0.25 0.16 0.1];
% pos = [0.25 0.16 0.0001];
% pos = [0.2 -0.18 0.1];
% pos = [0.2 -0.18 0.008];
% pos = [0.2 -0.18 (0.008+0.01)];
% pos = [0.2 -0.18 (0.008+0.01+0.01)];

%
% ang = [1.5*pi,pi,0];
% % poseTF = trvec2tform(pos)*eul2tform(ang);
%
% % hold on
% % plotTransforms(pos,eul2quat([0 0 0]),FrameSize=0.1);
%
% weights = [0.9 0.9 0.9 1 1 1];
% pose = get_new_pose(robot,pos,ang,weights);
%
% figure
% show(robot,pose,PreservePlot=false)
% axis tight
%
% print_pose(pose);
%
% end
