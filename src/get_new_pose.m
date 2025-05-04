function pose = get_new_pose(robot, position, angle, varargin)
  if nargin < 4
    weights = [0.9 0.9 0.9 1 1 1];
  else
    weights = varargin{1};
  end
  if nargin < 5
    initialGuess = homeConfiguration(robot);
  else
    initialguess = varargin{2};
  end

  poseTF = trvec2tform(position) * eul2tform(angle);
  ik = inverseKinematics("RigidBodyTree",robot);
  [pose, ~] = ik("body7",poseTF,weights,initialGuess);
end
