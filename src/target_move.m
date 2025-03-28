function configSoln = target_move(robot, pos, angles, weights)
poseTF = trvec2tform(pos) * eul2tform(angles);
ik = inverseKinematics("RigidBodyTree",robot);
initialguess = homeConfiguration(robot);
[configSoln, ~] = ik("body7",poseTF,weights,initialguess);
end
