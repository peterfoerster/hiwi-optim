% Run the optimization employing the NLopt library.
order = 4;

N_ctrl = order+2;
x_init = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x_init, order, 2*N_ctrl);

cst_func  = @(x) cost_function_max(x, order);
vol_cstr  = @(x) volume_constraint(x, order);
% ctrl_cstr = @(x) ctrl_constraint(x, order, N_ctrl);

% local: {COBYLA} global: {AGS, ISRES}
opt.algorithm     = NLOPT_LN_COBYLA;
opt.min_objective = cst_func;
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {vol_cstr};
opt.verbose       = 1;
% order=3: 150 + 25 per control point
opt.maxeval       = 175;
opt.maxtime       = 20*60*60;

tic;
[x_opt, obj_opt, retcode] = nlopt_optimize (opt, x_init);
fprintf('\nnlopt_optimize: %d min\n', toc/60);

save(['result_nlopt_order=' num2str(order) '.mat'], 'x_opt', 'obj_opt');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
