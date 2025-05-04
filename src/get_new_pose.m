function pose = get_new_pose(robot, position, angle, weights, initialguess)
  if nargin < 3
    weights = [0.9 0.9 0.9 1 1 1];
  end
  if nargin < 4
    initialguess = homeConfiguration(robot);
  end
  poseTF = trvec2tform(position) * eul2tform(angle);
  ik = inverseKinematics("RigidBodyTree",robot);
  [pose, ~] = ik("body7",poseTF,weights,initialguess);
end
