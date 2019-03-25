function [problem_data, method_data] = init_potential (geometry_file, voltage)
problem_data.geo_name = [geometry_file '.txt'];

problem_data.nmnn_sides   = [3];
problem_data.drchlt_sides = [1,2];

problem_data.c_diff = @(x,y) 8.854e-12*ones(size(x));

% no static sources
problem_data.f = @(x,y) zeros(size(x));
problem_data.g = @(x,y,ib) nm_bc (ib, x, y);
problem_data.h = @(x,y,ib) drl_bc (ib, x, y, voltage);

method_data.degree = [2,2];
method_data.regularity = [1,1];
% determined by convergence study
method_data.nsub = [8,8];
% maybe test this again?
method_data.nquad = [3,3];
end
