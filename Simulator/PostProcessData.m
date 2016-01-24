
% Clear workspace
clear all; close all; clc;

% Load data
load('FullOptV1.mat');
load('FallTimeRel.mat');

% Plots
figure
subplot(1,2,1)
plot(H0Vec,aVecOpt(1,:),'+-');
xlabel('Initial Height [m]')
ylabel('Kp Knee')

subplot(1,2,2)
plot(TfVec,aVecOpt(1,:),'+-');
xlabel('Fall Time [sec]')

figure
subplot(1,2,1)
plot(H0Vec,aVecOpt(2,:),'+-');
xlabel('Initial Height [m]')
ylabel('Kd Knee')

subplot(1,2,2)
plot(TfVec,aVecOpt(2,:),'+-');
xlabel('Fall Time [sec]')

figure
subplot(1,2,1)
plot(H0Vec,aVecOpt(3,:),'+-');
xlabel('Initial Height [m]')
ylabel('Damper coefficient')

subplot(1,2,2)
plot(TfVec,aVecOpt(3,:),'+-');
xlabel('Fall Time [sec]')





