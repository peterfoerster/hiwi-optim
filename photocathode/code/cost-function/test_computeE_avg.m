clear all; close all; clc

geometry_file = 'photocathode_200kV_v3';
voltage = -200e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data);

[E_avg] = computeE_avg (u(space.gnum{12}), msh.msh_patch{12}, space.sp_patch{12}, geometry(12));
