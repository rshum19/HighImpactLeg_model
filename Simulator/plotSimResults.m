
clear all; close all; clc;
trial1 = load('ResultsBadV2.mat');
trial2 = load('ResultsGoodV2.mat');
trial3 = load('Trial3.mat');
trial4 = load('Trial4.mat');

figure
%plot(trial1.GRF.time,trial1.GRF.data(:,3),trial2.GRF.time,trial2.GRF.data(:,3),trial3.GRF.time,trial3.GRF.data(:,3),trial4.GRF.time,trial4.GRF.data(:,3));
plot(trial1.GRF.time,trial1.GRF.data(:,3),'linewidth',2);%,trial2.GRF.time,trial2.GRF.data(:,3),'linewidth',2);
ylabel('GRF [N]')
xlabel('Time [sec]')
legend('Controller Off','Controller On')
title('GRFz Drop jump 3m')

figure
plot(trial1.GRF.time,trial1.GRF.data(:,3),trial2.GRF.time,trial2.GRF.data(:,3),'linewidth',2);
ylabel('GRF [N]')
xlabel('Time [sec]')
legend('Controller Off','Controller On')
title('GRFz Drop jump 3m')
% plot(trial1.FootPos.time,trial1.FootPos.data(:,3),trial2.FootPos.time,trial2.FootPos.data(:,3),trial3.FootPos.time,trial3.FootPos.data(:,3))

figure
plot(trial1.tauK.time,trial1.KneePos,trial2.tauK.time,trial2.KneePos,'linewidth',2);
ylabel('Knee Angular Pos. [rad]')
xlabel('Time [sec]')
legend('Controller Off','Controller On')
title('Knee Angular Position 4m')