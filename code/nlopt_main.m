% Run the optimization employing the NLopt library.
order = 8;
% [x_opt]
load('fit_init_run2.mat');

if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end
x_init = zeros(2*N_ctrl,1);
[lb, ub] = compute_bounds (x_init, order, 2*N_ctrl);
% use ls fit as initial shape
x_init = x_opt;

cst_func  = @(x) cost_function_abs_max(x, order);
vol_cstr  = @(x) volume_constraint(x, order);

% local: {COBYLA} global: {AGS, ISRES}
% opt.algorithm     = NLOPT_LN_COBYLA;
opt.algorithm     = NLOPT_GN_ISRES;
% 4 x nd
opt.population    = 10*length(x_init);
opt.min_objective = cst_func;
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {vol_cstr};
opt.verbose       = 1;
% opt.stopval       = 9.1e6;
opt.ftol_abs      = 1e4;
% opt.maxeval       = 450;
opt.maxtime       = 7*24*60*60;

tic;
[x_opt, obj_opt, retcode] = nlopt_optimize (opt, x_init);
fprintf('\nnlopt_optimize: %d min\n', toc/60);

save(['result_nlopt_order=' num2str(order) '.mat'], 'x_opt', 'obj_opt');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
