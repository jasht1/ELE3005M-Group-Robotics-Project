positions = get_positions();
robot = get_nyro_body();

% --- IK setup ---
ik = inverseKinematics("RigidBodyTree", robot);
weights = [0.9 0.9 0.9 1 1 1];
initialguess = homeConfiguration(robot);
ros = [1.5*pi, pi, 0]; % Constant orientation

% Compute all configurations
configs = zeros(size(positions, 1), numel(initialguess));

for i = 1:size(positions, 1)
    pos = positions(i, :);
    poseTF = trvec2tform(pos) * eul2tform(ros);
    [configSoln, ~] = ik("body7", poseTF, weights, initialguess);
    configs(i, :) = [configSoln.JointPosition];
end

% --- Animate ---
fig = figure('Color', 'w');
filename = 'Exports/stack_blocks_positions.gif';
loopFrames = 2; % Number of times to loop through all poses

for loop = 1:loopFrames
    for i = 1:size(configs, 1)
        % Rebuild configuration struct
        configStruct = initialguess;
        for j = 1:numel(configStruct)
            configStruct(j).JointPosition = configs(i, j);
        end

        show(robot, configStruct, 'PreservePlot', false, 'Frames', 'on', 'Visuals', 'on');
        title(['Step ' num2str(i)], 'FontSize', 14)
        view(3)
        axis equal
        xlim([-0.5 0.5]); ylim([-0.5 0.5]); zlim([0 0.6]);
        drawnow

        % Capture frame and write to GIF
        frame = getframe(fig);
        im = frame2im(frame);
        [A,map] = rgb2ind(im,256);

        if i == 1 && loop == 1
            imwrite(A, map, filename, 'gif', 'LoopCount', inf, 'DelayTime', 0.4);
        else
            imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.4);
        end
    end
end
