pkg load geopdes;

order  = 3;
N_ctrl = 4*(order-2);
x_init = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x_init, order, 2*N_ctrl);

% global: CRS, DIRECT, MLSL, AGS, ESCH
% local:  BOBYQA, Sbplx

% nlopt interface
opt.algorithm     = NLOPT_AUGLAG;
opt.n             = 2*N_ctrl;
opt.min_objective = @(x) cost_function_max(x, order);
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {@(x) volume_constraint(x, order), @(x) ctrl_constraint(x, order, N_ctrl)};
opt.verbose       = 1;
opt.local_optimizer.algorithm = NLOPT_LN_BOBYQA;
% base with order 3 needs 150 and +300 per order
opt.local_optimizer.maxeval = 24;
opt.local_optimizer.maxtime = 15*60*60;
opt.maxeval = 24;
opt.maxtime = 15*60*60;

tic;
[x_opt, obj, retcode] = nlopt_optimize (opt, x_init);
fprintf('\ntime elapsed for optimization: %d min\n', toc/60);

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
