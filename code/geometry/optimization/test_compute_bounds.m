% Compute the bounds on the control points.
order = 8;
filename = ['v6_opt_order=' num2str(order)];

if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end
x = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x, order, 2*N_ctrl);
plot_bounds(lb, ub, filename, order, x);
return
% test maximal volume
x(1:3)   = lb(1:3);
x(4)     = ub(4);
x(6:end) = ub(6:end);
create_geometry_opt (filename, x, order);
