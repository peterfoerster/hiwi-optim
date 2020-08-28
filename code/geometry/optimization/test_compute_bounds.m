% Compute the bounds on the control points.
order = continuity = 8;
continuity = 7;
if (continuity < order)
    filename = ['v6_opt_order=' num2str(order) '_continuity=' num2str(continuity)];
else
    filename = ['v6_opt_order=' num2str(order)];
end

if (order >= 8)
    N_ctrl = order-3;
    if (continuity < order)
        N_ctrl = N_ctrl + order-continuity;
    end
end
x = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x, order, 2*N_ctrl, continuity);
plot_bounds(lb, ub, order, x, continuity);
