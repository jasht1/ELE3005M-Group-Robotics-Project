function pose = target_move(robot, position, angle, weights)
  poseTF = trvec2tform(position) * eul2tform(angle);
  ik = inverseKinematics("RigidBodyTree",robot);
  initialguess = homeConfiguration(robot);
  [pose, ~] = ik("body7",poseTF,weights,initialguess);
end
