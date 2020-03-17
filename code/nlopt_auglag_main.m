clear all; close all; clc;
pkg load geopdes;

order  = 5;
N_ctrl = 4*(order-2);
x_ini  = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x_ini, order, 2*N_ctrl);

% global: CRS, DIRECT, MLSL, AGS, ESCH
% local: BOBYQA, Sbplx

% nlopt interface
opt.algorithm     = NLOPT_AUGLAG;
opt.n             = 2*N_ctrl;
opt.min_objective = @(x) cost_function_max(x, order);
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {@(x) volume_constraint(x, order), @(x) ctrl_constraint(x, order, N_ctrl)};
opt.verbose       = 1;
opt.local_optimizer.algorithm = NLOPT_LN_BOBYQA;
% base with order 3 needs 150 and +300 per degree
opt.maxeval = 750;
opt.maxtime = 48*60*60;

tic;
[x_opt, obj, retcode] = nlopt_optimize (opt, x_ini);
fprintf('\ntime elapsed for optimization: %d min\n', toc/60);
return
% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
