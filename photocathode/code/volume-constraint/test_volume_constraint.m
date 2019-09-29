clear all; close all; clc;
order  = 4;
N_ctrl = 13*(order-2) - 2;
x      = zeros(N_ctrl,1);

% test individual control points
x(3)  = -0.005;
x(7)  = -0.005;
x(8)  = 0.005;
x(9)  = -0.005;
x(10) = 0.005;

tic;
volume_constraint = @(x) volume_constraint(x, order);
[h] = volume_constraint(x)
fprintf('\ntime elapsed for solution: %d min\n', toc/60);

tic;
volume_constraint_nlopt = @(x) volume_constraint_nlopt(x, order);
[fc] = volume_constraint_nlopt(x, order)
fprintf('\ntime elapsed for solution: %d min\n', toc/60);
