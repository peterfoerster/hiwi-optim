pkg load geopdes;
clf;

order    = 3;
N_ctrl   = 5*(order-2);
x        = zeros(2*N_ctrl,1);

tic;
cost_function = @(x) cost_function_max(x, order);
[obj] = cost_function (x)
fprintf('\n cost function %d min \n', toc/60);
