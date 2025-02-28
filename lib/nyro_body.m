body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1', 'revolute');
tform = trvec2tform([0,0,0]);
setFixedTransform(jnt1,tform);
body1.Joint = jnt1;
robot = rigidBodyTree;
addBody(robot, body1,'base');
showdetails(robot);
show(robot);
axis tight;

body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2', 'revolute');
tform2 = trvec2tform([0, 0, 0.08])*eul2tform([0, 0, -pi/2]);
setFixedTransform(jnt2,tform2);
body2.Joint = jnt2;
addBody(robot,body2,'body1');

body3 = rigidBody('body3');
jnt3 = rigidBodyJoint('jnt3', 'revolute');
tform3 = trvec2tform([0, -0.21, 0]);
setFixedTransform(jnt3,tform3);
body3.Joint = jnt3;
addBody(robot,body3,'body2');

body4 = rigidBody('body4');
jnt4 = rigidBodyJoint('jnt4', 'revolute');
tform4 = trvec2tform([0, -0.03, -0.0415])*eul2tform([0, -pi/2, 0]);
setFixedTransform(jnt4,tform4);
body4.Joint = jnt4;
addBody(robot,body4,'body3');

body5 = rigidBody('body5');
jnt5 = rigidBodyJoint('jnt5', 'revolute');
tform5 = trvec2tform([0, 0, -0.180])*eul2tform([0, pi/2, 0]);
setFixedTransform(jnt5,tform5);
body5.Joint = jnt5;
addBody(robot,body5,'body4');

body6 = rigidBody('body6');
jnt6 = rigidBodyJoint('jnt6', 'revolute');
tform6 = trvec2tform([0.0237, 0, 0])*eul2tform([0, -pi/2, 0]);
setFixedTransform(jnt6,tform6);
body6.Joint = jnt6;
addBody(robot,body6,'body5');

