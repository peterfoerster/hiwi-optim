clear all; close all; clc;

% nlopt interface, need to use augmented Lagrangian for constraint
opt.algorithm     = NLOPT_LN_BOBYQA;
opt.min_objective = @(x) x^2;
opt.maxtime       = 4*60*60;
opt.verbose       = 1;

[x_opt, obj, retcode] = nlopt_optimize (opt, 10);
