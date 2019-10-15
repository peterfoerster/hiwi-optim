clear all; close all; clc;
order    = 3;
N_ctrl   = 11*(order-2) - 2;
x        = zeros(N_ctrl,1);

% positive differences are inside the correct domain
% only use minimum difference as constraint function
% test extensively, use average of maxima over all patches
% test individual control points
% x(1) = 0.005;

tic;
fc = ctrl_constraint(x, order, N_ctrl)
fprintf('\ntime elapsed for solution: %d min\n', toc/60);
