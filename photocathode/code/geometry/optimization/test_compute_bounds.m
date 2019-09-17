clear all; close all; clc;

N_inc  = 1;
N_ctrl = 12*N_inc+8;
x_ini = zeros(N_ctrl,1);

[lb, ub, ptcs] = compute_bounds (N_inc, N_ctrl, x_ini);

plot_ctrl_optim (ptcs);

[x, y] = compute_ctrl_coords (N_inc, ptcs);

[lb, ub] = compute_bounds_diff (N_inc, x, y, lb, ub);

plot_bounds (N_inc, x, y, lb, ub);
