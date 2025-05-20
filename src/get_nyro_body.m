function robot = get_nyro_body()
  robot = rigidBodyTree; % Initialises the robot as a rigid body tree.
  robot.DataFormat = 'row';

  body1 = rigidBody('body1') % Creates a rigidbody called 'body1'.
  jnt1 = rigidBodyJoint('jnt1', 'revolute') % Creates a revolute joint called 'jnt1'.
  jnt1.PositionLimits = [-3.05433, 3.05433]; % Sets joint limits in radians based on the robot's specification.
  tform = trvec2tform([0,0,0]) % Initial transformation.
  setFixedTransform(jnt1,tform) % Sets the transform for the joint.
  body1.Joint = jnt1 % Attaches the joint to the body.
  addBody(robot, body1,'base') % Attaches 'body 1' to the base of the robot.


  % Repeat of the above code for body 1 and joint 1, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  body2 = rigidBody('body2')
  jnt2 = rigidBodyJoint('jnt2', 'revolute')
  tform2 = trvec2tform([0, 0, 0.193])*eul2tform([0, 0, pi/2]);
  jnt2.PositionLimits = [-1.5708,0.6405358]; 
  setFixedTransform(jnt2,tform2);
  body2.Joint = jnt2;
  addBody(robot,body2,'body1'); % Attaches to body 1

  % Repeat of the above code for body 3 and joint 3, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  body3 = rigidBody('body3')
  jnt3 = rigidBodyJoint('jnt3', 'revolute')
  tform3 = trvec2tform([0, 0.21, 0]);
  jnt3.PositionLimits = [-1.39626,1.5708];
  setFixedTransform(jnt3,tform3);
  body3.Joint = jnt3;
  addBody(robot,body3,'body2');

  % Repeat of the above code for body 4 and joint 4, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  body4 = rigidBody('body4')
  jnt4 = rigidBodyJoint('jnt4', 'revolute')
  tform4 = trvec2tform([0.0415, 0.03, 0])*eul2tform([0, pi/2, 0]);
  jnt4.PositionLimits = [-3.05433, 3.05433];
  setFixedTransform(jnt4,tform4);
  body4.Joint = jnt4;
  addBody(robot,body4,'body3');

  % Repeat of the above code for body 5 and joint 5, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  body5 = rigidBody('body5')
  jnt5 = rigidBodyJoint('jnt5', 'revolute')
  tform5 = trvec2tform([0, 0, 0.180])*eul2tform([0, -pi/2, 0]);
  jnt5.PositionLimits = [-1.74533,1.91986];
  setFixedTransform(jnt5,tform5);
  body5.Joint = jnt5;
  addBody(robot,body5,'body4');

  % Repeat of the above code for body 6 and joint 6, defining the correct location,
  % orientation and rotation limits. Each is attached to the last.
  body6 = rigidBody('body6')
  jnt6 = rigidBodyJoint('jnt6', 'revolute')
  tform6 = trvec2tform([0.0237, 0, 0])*eul2tform([0, pi/2, 0]);
  jnt6.PositionLimits = [-2.5743606, 2.5743606];
  setFixedTransform(jnt6,tform6);
  body6.Joint = jnt6;
  addBody(robot,body6,'body5');

  % Similar to the code above, this is how the end effector is modelled.
  body7 = rigidBody('body7')
  jnt7 = rigidBodyJoint('jnt7', 'fixed') % Creates a fixed joint to represent the end effector.
  tform7 = trvec2tform([0, 0, 0.08])*eul2tform([0, 0, 0]);
  setFixedTransform(jnt7,tform7);
  body7.Joint = jnt7;
  addBody(robot,body7,'body6');
end
