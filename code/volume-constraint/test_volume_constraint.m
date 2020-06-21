% Compute the volume constraint on the electrode.
order = 8;

if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end
x = zeros(2*N_ctrl,1);

% test maximal volume
% [lb, ub] = compute_bounds (x, order, 2*N_ctrl);
% x(1:3)   = lb(1:3);
% x(4)     = ub(4);
% x(6:end) = ub(6:end);

tic;
vol_cstr = @(x) volume_constraint(x, order);
fc       = vol_cstr(x);
fprintf('\nvolume_constraint: %d min\n', toc/60);
