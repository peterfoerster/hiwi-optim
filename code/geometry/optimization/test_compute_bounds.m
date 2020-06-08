% Compute the bounds on the control points.
order    = 5;
filename = ['v6_opt_order=' num2str(order)];


if (order == 3)
    N_ctrl = 6*1;
elseif (order == 4)
    N_ctrl = 2*1 + 1*2 + 2*1;
elseif (order == 5)
    N_ctrl = 2*1 + 1*3 + 2*1;
end
x = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x, order, 2*N_ctrl);
plot_bounds(lb, ub, filename, order);
