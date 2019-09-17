clear all; close all; clc;

N_inc  = 2;
N_ctrl = 12*N_inc+8;
x_ini = zeros(N_ctrl,1);

[lb, ub, ptcs] = compute_bounds (N_inc, N_ctrl, x_ini);

plot_ctrl_optim (ptcs);

[x, y] = compute_ctrl_coords (N_inc, ptcs);

plot_bounds (N_inc, x, y, lb, ub);
