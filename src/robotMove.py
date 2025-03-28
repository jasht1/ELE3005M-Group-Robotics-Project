from niryo_robot_python_ros_wrapper.ros_wrapper import *
import sys
import rospy

rospy.init_node('niryo_blockly_interpreted_code')
n = NiryoRosWrapper()

n.calibrate_auto()

try:
   n.update_tool()
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.release_with_tool()
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.grasp_with_tool() #Grabs first block
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.release_with_tool()
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.grasp_with_tool() #Grabs second block
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.release_with_tool()
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.grasp_with_tool() #Grabs third block
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.move_joints([0, 0, 0, 0, 0, 0])
   n.release_with_tool()
   n.move_joints(*[0, 0, 0, 0, 0, 0])

except NiryoRosWrapperException as e:
   sys.stderr.write(str(e))
