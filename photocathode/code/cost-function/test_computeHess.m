clear all; close all; clc;

geometry_file = 'photocathode_200kV_v1';
voltage = -200e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data);

Hess = sp_eval(u(space.gnum{10}), space.sp_patch{10}, geometry(10), {0.5, 0.5}, 'laplacian')
