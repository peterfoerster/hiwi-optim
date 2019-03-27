clear all; close all; clc;
pkg load geopdes;

% plot the geometry
% short, long
geometry_file = 'gun_half_short';
nsub = 100;
width = 4;
options.numbers = 1;
options.boundary = 1;
figure;
plot_geometry (geometry_file, nsub, width, options);

% solve for the potential
% voltage = 90e3;
% [problem_data, method_data] = init_potential (geometry_file, voltage);
% [geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);

% plot the potential and the absolute value of the gradient
% figure;
% nsub_x = method_data.nsub(1);
% nsub_y = method_data.nsub(2);
% plot_potential (nsub_x, nsub_y, u, space, geometry);
% figure;
% plot_gradient (nsub_x, nsub_y, u, space, geometry);

% convergence study (with absolute error)
% filename = 'gun_half_short_degree=2_nsub=var';
% plot_convergence_study (filename);
