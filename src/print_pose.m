function print_pose(pose)
  jointPositions = [pose.JointPosition]'
  jointPositionText = strjoin(string([pose.JointPosition]), ',')
  jointPositionText
end
