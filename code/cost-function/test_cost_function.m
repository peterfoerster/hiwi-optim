pkg load geopdes;

order  = 3;
N_ctrl = 6*(order-2);
x      = zeros(2*N_ctrl,1);

tic;
cst_func = @(x) cost_function_max(x, order);
[obj] = cst_func(x)
fprintf('\ncost_function_max: %d min\n', toc/60);
