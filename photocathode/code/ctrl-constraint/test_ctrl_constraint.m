clear all; close all; clc;
order    = 4;
N_ctrl   = 11*(order-2) - 2;
x        = zeros(N_ctrl,1);

% test extensively, use average of maxima over all patches
% test individual control points
% x(1) = 0.005;
% x(6)  = 0.005;
% x(7)  = -0.005;
% x(8)  = 0.005;
% x(9)  = -0.005;
% % order=4
% x(17) = 0.005;
% % order=5
% x(23) = 0.005;

f_c = ctrl_constraint(x, order, N_ctrl);
