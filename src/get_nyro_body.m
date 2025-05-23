function robot = get_nyro_body()
  robot = rigidBodyTree; % Initialises the robot as a rigid body tree.
  robot.DataFormat = 'row';

  Base = rigidBody('Base'); % Creates a rigidbody for the Base.
  jnt1 = rigidBodyJoint('jnt1', 'revolute'); % Creates a revolute joint called 'jnt1'.
  jnt1.PositionLimits = [-3.05433, 3.05433]; % Sets joint limits in radians based on the robot's specification.
  tform = trvec2tform([0,0,0]); % Initial transformation.
  setFixedTransform(jnt1,tform); % Sets the transform for the joint.
  Base.Joint = jnt1; % Attaches the joint to the body.
  addBody(robot, Base,'base'); % Attaches 'Base' to the base of the robot.


  % Repeat of the above code for Base and joint 1, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  Shoulder = rigidBody('Shoulder');
  jnt2 = rigidBodyJoint('jnt2', 'revolute');
  tform2 = trvec2tform([0, 0, 0.193])*eul2tform([0, 0, pi/2]);
  jnt2.PositionLimits = [-1.5708,0.6405358]; 
  setFixedTransform(jnt2,tform2);
  Shoulder.Joint = jnt2;
  addBody(robot,Shoulder,'Base'); % Attaches to Base

  % Repeat of the above code for the arm and joint 3, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  Arm = rigidBody('Arm');
  jnt3 = rigidBodyJoint('jnt3', 'revolute');
  tform3 = trvec2tform([0, 0.21, 0]);
  jnt3.PositionLimits = [-1.39626,1.5708];
  setFixedTransform(jnt3,tform3);
  Arm.Joint = jnt3;
  addBody(robot,Arm,'Shoulder');

  % Repeat of the above code for the elbow and joint 4, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  Elbow = rigidBody('Elbow');
  jnt4 = rigidBodyJoint('jnt4', 'revolute');
  tform4 = trvec2tform([0.0415, 0.03, 0])*eul2tform([0, pi/2, 0]);
  jnt4.PositionLimits = [-3.05433, 3.05433];
  setFixedTransform(jnt4,tform4);
  Elbow.Joint = jnt4;
  addBody(robot,Elbow,'Arm');

  % Repeat of the above code for the forearm and joint 5, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  Forearm = rigidBody('Forearm');
  jnt5 = rigidBodyJoint('jnt5', 'revolute');
  tform5 = trvec2tform([0, 0, 0.180])*eul2tform([0, -pi/2, 0]);
  jnt5.PositionLimits = [-1.74533,1.91986];
  setFixedTransform(jnt5,tform5);
  Forearm.Joint = jnt5;
  addBody(robot,Forearm,'Elbow');

  % Repeat of the above code for the wrist and joint 6, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  Wrist = rigidBody('Wrist');
  jnt6 = rigidBodyJoint('jnt6', 'revolute');
  tform6 = trvec2tform([0.0237, 0, 0])*eul2tform([0, pi/2, 0]);
  jnt6.PositionLimits = [-2.5743606, 2.5743606];
  setFixedTransform(jnt6,tform6);
  Wrist.Joint = jnt6;
  addBody(robot,Wrist,'Forearm');

  % Similar to the code above, this is how the end effector is modelled.
  EndEffector = rigidBody('EndEffector');
  jnt7 = rigidBodyJoint('jnt7', 'fixed'); % Creates a fixed joint to represent the end effector.
  tform7 = trvec2tform([0, 0, 0.08])*eul2tform([0, 0, 0]);
  setFixedTransform(jnt7,tform7);
  EndEffector.Joint = jnt7;
  addBody(robot,EndEffector,'Wrist');
end
