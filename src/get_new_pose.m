function pose = get_new_pose(robot, position, angle, weights)
  if nargin < 3
    weights = [0.9 0.9 0.9 1 1 1];
  end
  poseTF = trvec2tform(position) * eul2tform(angle);
  ik = inverseKinematics("RigidBodyTree",robot);
  initialguess = homeConfiguration(robot);
  [pose, ~] = ik("body7",poseTF,weights,initialguess);
end
