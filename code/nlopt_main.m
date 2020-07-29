% Run the optimization employing the NLopt library.

order = 10;
% [x_opt]
% load('result_ls_fit_init.mat');
% load('result_nlopt_order=8_run5.mat');

if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end
x_init = zeros(2*N_ctrl,1);
[lb, ub] = compute_bounds (x_init, order, 2*N_ctrl);
% use previous result as starting shape (automatic for order > 8)
% x_init = x_opt;

cst_func  = @(x) cost_function_abs_max(x, order);
vol_cstr  = @(x) volume_constraint(x, order);

% local: {COBYLA} global: {AGS, ISRES}
opt.algorithm     = NLOPT_LN_COBYLA;
% opt.algorithm     = NLOPT_GN_ISRES;
% opt.population    = 1*length(x_init);
opt.min_objective = cst_func;
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {vol_cstr};
opt.verbose       = 1;
opt.ftol_rel      = 1e-4;
opt.ftol_abs      = 1e2;
opt.maxtime       = 7*24*60*60;

tic;
[x_opt, obj_opt, retcode] = nlopt_optimize (opt, x_init);
fprintf('\nnlopt_optimize: %d min\n', toc/60);

save(['result_nlopt_order=' num2str(order) '.mat'], 'x_opt', 'obj_opt');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
