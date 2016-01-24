function cost = costFunc( q, y0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


% Leg properties
leg_mechanical_params;

H0 = y0;
Kp_knee = q(1);
Kd_knee = q(2);
B0 = q(3);

optionSim = simset('SrcWorkspace','current');

% Run Simulation
sim('robot_leg_opt',[],optionSim);

kneeTgrt = -150*pi/180;
% Calculate cost
cost = 10*(kneeTgrt - min(KneePos))^2 + (0 - FootPos(end,3))^2 + (0 - Zint)^2;

end

