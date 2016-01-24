%% ---------- Initialization -----------------
% Clear workspace
clear all; close all; clc;

% Initialize Leg
leg_mechanical_params;


% Values to loop through
H0Vec = linspace(1.5,4,20)';         % Height [m]

% Allocate memory
Q0 = [Kp_knee,Kd_knee, B0]';

%% ----------  Optimize a0 for varying heights ----------
%for bhvrIdx = 1:length(k2Vec)
    
 %   fprintf('Optimizing for behaviour version: %d....\n',bhvrIdx);
for icIdx = 1:length(H0Vec)
        y0 = H0Vec(icIdx);
        fprintf('Optimizing for y0: %d....\n',y0);

        [aVecOpt(:,icIdx),fvalVec(:,icIdx)] = fminsearch(@(q)costFunc(q,y0),Q0);

        %fprintf'Optimum angle of attack: %d\n\n',aVecOpt(icIdx,bhvrIdx));
  %  end
    
    % Find ai(yi) function
   %  p(bhvrIdx,:) = polyfit(y0Vec,aVecOpt(:,bhvrIdx),order);
   %  aVec(:,bhvrIdx) = polyval(p(bhvrIdx,:),y0Vec);
end