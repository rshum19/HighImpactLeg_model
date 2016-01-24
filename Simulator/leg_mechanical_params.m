% File name: initLegModel
% Description:  Initializes the variables required to run the simmechanics
%               model 'robot_leg_v1.slx'
% Author: Roberto Shu
% Last Edit: 9/27/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% *************************** %
% 1. Enviroment Model %
% *************************** %

% Clear workspace
%clear all; close all; clc;

% acceleration due to gravity
g = 9.81; %[m/s^2]

Kg = 12^5;  % Ground stiffness coefficient [N/m]
Bg = 100;    % Ground damping coefficient [N-s/m]

%% *************************** %
% 2. Leg Geometry %
% *************************** %
mass = 15; 
maxStroke = 0.074;
maxTauK = inf; % Max knee torque [N/m]

lspring0 = 0.5582; % Spring rest length [m]
LMidShin = 0;
LBtnShin = 0;

K = 7500;       % Spring constant [N/m]
B0 = 1881.7;         % Damping coefficient [N/(m/s)]
%B = 0;
H0 = 5;         % Initial height [m]
thetaH0 = 45*pi/180;    % Initial hip angle [rad]
thetaK0 = -60*pi/180;    % Initial knee angle [rad]
dthetaK0 = 0;    % Initial knee angle [rad]
dthetaH0 = 0;    % Initial knee angle [rad]

% Joint Limits

% Passive Element Geometry Limits
DamperStrokeMin = 0;    % damper min stroke [m]
DamperStrokeMax = 0.1;  % damper max. stroke [m]

SprgDeflecMax = pi/2;   % spring joint max deflection [rad]
SprgDeflecMin = 0;      % spring joint min deflection [rad]

% MR Damper Force characteristics
% F = (alf0 + alf1*sqrt(I))*tanh(beta0*Xdot + gam0*sgn(X)) + del0*Xdot + eta0*X + kap0
alf0 = -23.1;
alf1 = 1215.2;
beta0 = 36.5;
gam0 = 1.6;
del0 = 1297;
eta0 = 1202.7;
kap0 = 0;

%% *************************** %
% 3. Motors & Transmission %
% *************************** %

% -----------------------------------------
% 3.1 Motors
% -----------------------------------------
r_rotor = 0.25;         % Rotor radius [m]

% -----------------------------------------
% 3.2 Harmonic Drive Transmission
% -----------------------------------------
N_GearRatio = 50;       % Transmission gear ratio 

rotorGear.r = 0.115;     % Ring Gear radius [m]
rotorGear.m = 1.2;       % Rotor weight [kg]
rotorGear.iz = 3.65e-4;     % Rotor Inertia [kgm^2]
rotorGear.i = [0 0 rotorGear.iz];    % Rotor Inertia moments [kgm^2]

idlerGear.r = 0.05;         % Idler gear radius [m]
idlerGear.m = 1e-5;
idlerGear.i = [0 0 1e-5];

outputGear.r = 0.115;        % Gear radius [m]
outputGear.m = 1e-5;    % Gear mass [kg]
outputGear.i = [0 0 1e-5];  % Gear inertia [kgm^2]



%% *************************** %
% 3. Boom Geometry %
% *************************** %

%% *************************** %
% 4. Ground Interaction Model %
% *************************** %

% -----------------------------------------
% 4.1 General Head-Arms-Trunk (HAT) Segment
% -----------------------------------------

% General head-arms-trunk (HAT) mass
m_HAT = 53.5; %[kg]

% thigh mass
m_T  = 8.5; %[kg]

% shank mass
m_S  = 3.5; %[kg]

% foot mass
m_F  = 1.25; %[kg] 1.25

% ----------------------
% 4.2 Vertical component
% ----------------------

% stiffness of vertical ground interaction
k_gy = (2*(m_F+m_S+m_T)+m_HAT)*g/0.01; %[N/m]

% max relaxation speed of vertical ground interaction
v_gy_max = 0.03; %[m/s]

% ------------------------
% 4.3 Horizontal component
% ------------------------

% sliding friction coefficient
mu_slide = 0.8;

% sliding to stiction transition velocity limit
vLimit = 0.01; %[m/s]

% stiffness of horizontal ground stiction
k_gx = (2*(m_F+m_S+m_T)+m_HAT)*g/0.1; %[N/m] 0.01

% max relaxation speed of horizontal ground stiction
v_gx_max = 0.03; %[m/s] 0.03

% stiction to sliding transition coefficient
mu_stick = 0.9;

%% *************************** %
% 5. Controller properties %
% *************************** %

% ------------------------
% 5.1 Desired values
% ------------------------

% Hip joint
thetaHd = thetaH0;
dthetaHd = 0;

% Knee joint
thetaKd = thetaK0;      % Desired knee joint position [rad/s]
dthetaKd = 0;           % Desired knee joint velocity [rad/s]

% ------------------------
% 5.2 PD gains
% ------------------------
Hp_knee = 50*0;
Hd_knee = 5*0;

Kp_knee = 100*10;
Kd_knee = 30;


% Kp_knee =412.564283154826;
% Kd_knee = 50.0154365124026;
% B0 = 3176.53165154019;

Kp_knee = 10*403.450740333601;
Kd_knee = 0.1*70.9058167659882;
B0 = 3266.28463901503;
H0 = 4;