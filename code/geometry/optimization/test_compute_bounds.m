% Compute the bounds on the control points.
order = 5;
filename = ['v6_opt_order=' num2str(order)];

N_ctrl = order+2;
x = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x, order, 2*N_ctrl);
plot_bounds(lb, ub, filename, order, x);
