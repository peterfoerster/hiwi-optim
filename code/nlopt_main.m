
order  = 3;
N_ctrl = 6*(order-2);
x_init = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x_init, order, 2*N_ctrl);

cst_func  = @(x) cost_function_max(x, order);
vol_cstr  = @(x) volume_constraint(x, order);
ctrl_cstr = @(x) ctrl_constraint(x, order, N_ctrl);

% local: {COBYLA} global: {AGS, ISRES}
opt.algorithm     = NLOPT_LN_COBYLA;
opt.min_objective = cst_func;
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {vol_cstr, ctrl_cstr};
opt.verbose       = 1;
% base with order 3 needs 150 and +300 per order
opt.maxeval       = 150;
opt.maxtime       = 15*60*60;

tic;
[x_opt, obj, retcode] = nlopt_optimize (opt, x_init);
fprintf('\n time elapsed for optimization: %d min \n', toc/60);

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
