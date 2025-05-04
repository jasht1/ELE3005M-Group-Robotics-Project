function [qMat, ts] = plan_trajectory(robot, positions, varargin)
  % Optionals
  if nargin < 3
    eulAngles = [1.5*pi,pi,0]; % End efector down
  else
    eulAngles = varargin{1};
  end

  if nargin < 4
    weights = [0.9 0.9 0.9 1 1 1]; % IK weights
  else
    weights = varargin{2};
  end

  if nargin < 5
    moveTime = 2.5;  % seconds per segment
  else
    moveTime = varargin{3};
  end

  if nargin < 6
    pauseTime = 0.5; % seconds pause at each position
  else
    pauseTime = varargin{4};
  end

  % Settings
  numPoints = size(positions, 1);
  numJoints = numel(homeConfiguration(robot));
  fps = 30;        % samples per second

  initialGuess = homeConfiguration(robot);
  qTargets = zeros(numPoints, numJoints);

  % solve each position
  for i = 1:numPoints 
    pos = positions(i, :);
    pose = get_new_pose(robot,pos,eulAngles,weights,initialGuess);
    qTargets(i, :) = [pose.JointPosition];
    initialGuess = pose; % start from prev pose
  end

  % interpolate, obvs this isn't going to be an accurate representation of the robots motion
  totalSteps = round(fps * (moveTime + pauseTime)) * (numPoints - 1);
  ts = linspace(0, (numPoints - 1) * (moveTime + pauseTime), totalSteps);
  qMat = zeros(totalSteps, numJoints);

  currentIdx = 1;
  for i = 1:numPoints - 1
    q1 = qTargets(i, :);
    q2 = qTargets(i + 1, :);
    
    tSeg = linspace(0, moveTime, round(moveTime * fps));
    tPause = linspace(0, pauseTime, round(pauseTime * fps));

    for j = 1:length(tSeg)
      alpha = j / length(tSeg);
      qMat(currentIdx, :) = (1 - alpha)^3 * q1 + 3 * (1 - alpha)^2 * alpha * q1 + 3 * (1 - alpha) * alpha^2 * q2 + alpha^3 * q2;
      currentIdx = currentIdx + 1;
    end

    for j = 1:length(tPause)
      qMat(currentIdx, :) = q2;
      currentIdx = currentIdx + 1;
    end
  end

  % Trim trailing prealloc if necessary
  qMat = qMat(1:currentIdx - 1, :);
  ts = ts(1:currentIdx - 1);
end
