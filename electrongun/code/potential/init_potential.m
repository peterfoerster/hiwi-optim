function [problem_data, method_data] = init_potential (voltage, degree, nsub)
problem_data.nmnn_sides   = [3];
problem_data.drchlt_sides = [1 2];

problem_data.c_diff = @(x,y) 8.854e-12*ones(size(x));

% no static sources
problem_data.f = @(x,y) zeros(size(x));
problem_data.g = @(x,y,ib) nm_bc (ib, x, y);
problem_data.h = @(x,y,ib) drl_bc (ib, x, y, voltage);

method_data.degree = [degree, degree];
method_data.regularity = [degree-1, degree-1];
method_data.nsub = [nsub, nsub];
method_data.nquad = [degree+1, degree+1];
end
