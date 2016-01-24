
clear all; close all; clc; 
load('OptResults1.mat')

H0Vec = linspace(1.5,4,10)'; 
%Q0 = [Kp_knee,Kd_knee, B0]';

figure
plot(H0Vec, aVecOpt(1,:),'r*','linewidth',2)
xlabel('Initial Height y_{0} [m]')
ylabel('Knee Stiffness [N/m]')

figure
plot(H0Vec, aVecOpt(2,:),'r*','linewidth',2)
xlabel('Initial Height y_{0} [m]')
ylabel('Knee Damping [Ns^2/m]')

figure
plot(H0Vec, aVecOpt(3,:),'r*','linewidth',2)
xlabel('Initial Height y_{0} [m]')
ylabel('Shin Damping [Ns^2/m]')