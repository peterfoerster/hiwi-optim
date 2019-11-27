clf; clc;

order    = 5;
filename = ['photocathode_200kV_optim_order=' num2str(order)];
N_ctrl   = 4*(order-2);
x        = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x, order, 2*N_ctrl);
plot_bounds(lb, ub, filename, order);
