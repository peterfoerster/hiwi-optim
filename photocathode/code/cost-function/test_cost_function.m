clear all; close all; clc;
N_inc = 1;
% total number of DOFs
N_ctrl = 12*N_inc+8;
x = zeros(N_ctrl,1);

x(5) = 0.01;

tic;
[obj] = cost_function (x)
fprintf('\ntime elapsed for solution: %d min\n', toc/60);
