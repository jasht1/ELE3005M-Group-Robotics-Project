
body7 = rigidBody('body7');
jnt7 = rigidBodyJoint('jnt7', 'fixed');
tform7 = trvec2tform([0, 0, 0.08])*eul2tform([0, 0, 0]);
setFixedTransform(jnt7,tform7);
body7.Joint = jnt7;
addBody(robot,body7,'body6');

show(robot);
axis tight;

pos = [0.15 0.15 0.005];
poseTF = trvec2tform(pos);

hold on;
plotTransforms(pos,eul2quat([0 0 0]),FrameSize=0.1);

ik = inverseKinematics("RigidBodyTree",robot);
weights = [0 1 1 1 1 1];
initialguess = homeConfiguration(robot);
[configSoln,solnInfo] = ik("body7",poseTF,weights,initialguess);

figure;
show(robot,configSoln,PreservePlot=false);
axis tight;
