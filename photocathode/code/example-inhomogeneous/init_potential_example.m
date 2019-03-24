function [problem_data, method_data] = init_potential_example (geometry_file, voltage)
problem_data.geo_name = geometry_file;

problem_data.nmnn_sides   = [3];
problem_data.drchlt_sides = [1 2];

% permittivity as a function on each patch
problem_data.c_diff = @(x,y,ip) permittivity_example(ip, x, y);

% no static sources
problem_data.f = @(x,y) zeros(size(x));
problem_data.g = @(x,y,ib) nm_bc (ib, x, y);
problem_data.h = @(x,y,ib) drl_bc (ib, x, y, voltage);

method_data.degree = [2 2];
method_data.regularity = [1 1];
% determined by convergence study
method_data.nsub = [8 8];
% do we need n-1 quadrature points to be exact?
method_data.nquad = [3 3];
end
