clear all; clf; clc;

order    = 4;
filename = ['photocathode_200kV_optim_order=' num2str(order)];
N_ctrl   = 11*(order-2) - 2;
x        = zeros(N_ctrl,1);

[lb, ub] = compute_bounds (x, order, N_ctrl);
plot_bounds(lb, ub, filename, order);
