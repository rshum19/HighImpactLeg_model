%% ---------- Initialization -----------------
% Clear workspace
clear all; close all; clc;

% Initialize Leg
leg_mechanical_params;


% Values to loop through
H0Vec = linspace(1.5,4,20)';         % Height [m]

% Allocate memory
Q0 = [Kp_knee,Kd_knee, B0]';
TfVec = [];
%% ----------  Optimize a0 for varying heights ----------
%for bhvrIdx = 1:length(k2Vec)
    
 %   fprintf('Optimizing for behaviour version: %d....\n',bhvrIdx);
for icIdx = 1:length(H0Vec)
    
    % Set fall height
    H0 = H0Vec(icIdx);
    
    % Simulate
    fprintf('Falling from H0: %d....\n',H0);
    sim('robot_leg');
    
    % Save to vector fall time
    TfVec(icIdx) = Tf;
end

% Save data
save('FallTimeRel.mat','H0Vec','TfVec');