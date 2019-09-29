clear all; clf; clc;

filename = 'photocathode_200kV_optim_order=3';
order  = 3;
N_ctrl = 13*(order-2) - 2;
x      = zeros(N_ctrl,1);

[lb, ub] = compute_bounds (filename, x, order, N_ctrl);
plot_bounds(lb, ub, filename, order);
