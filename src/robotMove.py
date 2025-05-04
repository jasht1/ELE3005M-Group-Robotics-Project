from niryo_robot_python_ros_wrapper.ros_wrapper import *
import sys
import rospy

rospy.init_node('niryo_blockly_interpreted_code')
n = NiryoRosWrapper()

n.calibrate_auto()

try:
   n.update_tool()
   n.move_joints(*[0, 0, 0, 0, 0, 0])
   n.release_with_tool()
   n.move_joints(*[0.7854,0.02812,-0.38475,1.4096e-08,-1.2142,0.7854]) #Above First Block
   n.move_joints(*[0.7854,-0.79849,-0.62722,2.7715e-08,-0.14508,0.7854]) #First Block Angles
   n.grasp_with_tool() #Grabs first block 
   n.move_joints(*[-6e-16,-0.37544,0.30945,5.8868e-17,-1.5048,8.8859e-16]) #Middle
   n.move_joints(*[-0.73282,-0.23936,-0.09027,-7.1918e-10,-1.2412,-0.73282]) #Above Drop 1
   n.move_joints(*[-0.73282,-0.90551,-0.31668,3.4677e-09,-0.3486,-0.73282]) #Drop Position 1
   n.release_with_tool()
   n.move_joints(*[-0.73282,-0.23936,-0.09027,-7.1918e-10,-1.2412,-0.73282]) #Above Drop 1
   n.move_joints(*[-6e-16,-0.37544,0.30945,5.8868e-17,-1.5048,8.8859e-16]) #Middle
   n.move_joints(*[0.73282,-0.23936,-0.09027,7.7748e-10,-1.2412,0.73282]) #Above Second Block
   n.move_joints(*[0.73282,-0.90551,-0.31668,1.7644e-08,-0.3486,0.73282]) #Second Block Angles
   n.grasp_with_tool() #Grabs second block
   n.move_joints(*[-6e-16,-0.37544,0.30945,5.8868e-17,-1.5048,8.8859e-16]) #Middle
   n.move_joints(*[-0.73282,-0.23936,-0.09027,-7.1918e-10,-1.2412,-0.73282]) #Above Drop 2
   n.move_joints(*[-0.73282,-0.83763,-0.33762,-1.9793e-08,-0.39555,-0.73282]) #Drop Position 2
   n.release_with_tool()
   n.move_joints(*[-0.73282,-0.23936,-0.09027,-7.1918e-10,-1.2412,-0.73282]) #Above Drop 2
   n.move_joints(*[-6e-16,-0.37544,0.30945,5.8868e-17,-1.5048,8.8859e-16]) #Middle
   n.move_joints(*[0.56931,-0.37061,0.078562,-2.1745e-09,-1.2788,0.56931]) #Above Third Block
   n.move_joints(*[0.56931,-0.97304,-0.14844,-5.4838e-09,-0.44931,0.56931]) #Third Block Angles
   n.grasp_with_tool() #Grabs third block
   n.move_joints(*[-6e-16,-0.37544,0.30945,5.8868e-17,-1.5048,8.8859e-16]) #Middle
   n.move_joints(*[-0.73282,-0.23936,-0.09027,-7.1918e-10,-1.2412,-0.73282]) #Above Drop 3
   n.move_joints(*[-0.73282,-0.78779,-0.34972,-4.5119e-09,-0.43328,-0.73282]) #Drop Position 3
   n.release_with_tool()
   n.move_joints(*[-0.73282,-0.23936,-0.09027,-7.1918e-10,-1.2412,-0.73282]) #Above Drop 3
   n.move_joints(*[-6e-16,-0.37544,0.30945,5.8868e-17,-1.5048,8.8859e-16]) #Middle

except NiryoRosWrapperException as e:
   sys.stderr.write(str(e))
