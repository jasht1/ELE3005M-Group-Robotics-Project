function pose = get_new_pose(robot, position, angle, varargin)
  if nargin < 4
    weights = [0.9 0.9 0.9 1 1 1];
  else
    weights = varargin{1};
  end
  if nargin < 5
    initialGuess = homeConfiguration(robot);
  else
    initialGuess = varargin{2};
  end

  poseTF = trvec2tform(position) * eul2tform(angle);
  ik = inverseKinematics("RigidBodyTree",robot);
  [pose, ~] = ik("EndEffector",poseTF,weights,initialGuess);
end
