% Computes the cost function for the optimization.
order = 8;

if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end
x = zeros(2*N_ctrl,1);

tic;
cst_func = @(x) cost_function_abs_max(x, order);
[obj] = cst_func(x)
fprintf('\ncost_function_max: %d min\n', toc/60);
