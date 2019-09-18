clear all; close all; clc;
N_inc = 2;
% total number of DOFs
N_ctrl = 12*N_inc+8;
x = zeros(N_ctrl,1);

% x(5) = 0.01;

[h] = volume_constraint(x)
[fc] = volume_constraint_nlopt(x)
