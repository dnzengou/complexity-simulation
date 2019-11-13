%% Initialization
clear ; close all; clc

%% 1) Plot of a random walk performed by a single agent
% Plot of a random walk performed by a single agent 
fprintf('Plot of a random walk performed by a single agent ... \n');
%fprintf('agents as random walks on a square grid (lattice) moving to a random neighboring tile using Von Neumann Neighborhood \n');
RandomWalkNormal()

fprintf('Program paused. Push enter to continue \n');
pause();

%% 
clear all,close all;clc;


%% 2) SIR model
Npop= 1000; % population
gamma = 0.1e-1 ; %  "sri infection" rate.
beta = 5e-3; % "sri infection" rate.
zeta= 9e-2; % sri recovery rate
delta= 1e-4; % susceptibles death rate
tmax = 100; % max duration of the simulation (non-dimensional)
dt = 0.005; % time step
plotOption = 1; % 1 to plot the data, 0 otherwise


[SRI,t] = sri(Npop,gamma,beta,zeta,delta,tmax,dt,plotOption);

fprintf('Program paused. Change value of N and restart simulation \n');
pause();

%% 
clear all,close all;clc;


