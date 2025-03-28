
robot = rigidBodyTree;

body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1', 'revolute');
jnt1.PositionLimits = [-3.05433, 3.05433];
tform = trvec2tform([0,0,0]);
setFixedTransform(jnt1,tform);
body1.Joint = jnt1;
addBody(robot, body1,'base');

body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2', 'revolute');
tform2 = trvec2tform([0, 0, 0.193])*eul2tform([0, 0, pi/2]);
jnt2.PositionLimits = [-1.5708,0.6405358];
setFixedTransform(jnt2,tform2);
body2.Joint = jnt2;
addBody(robot,body2,'body1');

body3 = rigidBody('body3');
jnt3 = rigidBodyJoint('jnt3', 'revolute');
tform3 = trvec2tform([0, 0.21, 0]);
jnt3.PositionLimits = [-1.39626,1.5708];
setFixedTransform(jnt3,tform3);
body3.Joint = jnt3;
addBody(robot,body3,'body2');

body4 = rigidBody('body4');
jnt4 = rigidBodyJoint('jnt4', 'revolute');
tform4 = trvec2tform([0.0415, 0.03, 0])*eul2tform([0, pi/2, 0]);
jnt4.PositionLimits = [-3.05433, 3.05433];
setFixedTransform(jnt4,tform4);
body4.Joint = jnt4;
addBody(robot,body4,'body3');

body5 = rigidBody('body5');
jnt5 = rigidBodyJoint('jnt5', 'revolute');
tform5 = trvec2tform([0, 0, 0.180])*eul2tform([0, -pi/2, 0]);
jnt5.PositionLimits = [-1.74533,1.91986];
setFixedTransform(jnt5,tform5);
body5.Joint = jnt5;
addBody(robot,body5,'body4');

body6 = rigidBody('body6');
jnt6 = rigidBodyJoint('jnt6', 'revolute');
tform6 = trvec2tform([0.0237, 0, 0])*eul2tform([0, pi/2, 0]);
jnt6.PositionLimits = [-2.5743606, 2.5743606];
setFixedTransform(jnt6,tform6);
body6.Joint = jnt6;
addBody(robot,body6,'body5');

body7 = rigidBody('body7');
jnt7 = rigidBodyJoint('jnt7', 'fixed');
tform7 = trvec2tform([0, 0, 0.08])*eul2tform([0, 0, 0]);
setFixedTransform(jnt7,tform7);
body7.Joint = jnt7;
addBody(robot,body7,'body6');

