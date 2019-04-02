clear all; close all; clc;
pkg load geopdes;

% plot the geometry
% plain, kink, insulator
geometry_file = 'photocathode_insulator';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);
nsub = 5;
width = 4;
options.numbers = 1;
options.boundary = 1;
figure;
plot_geometry (geometry, nsub, width, options, boundaries);

% solve for the potential
voltage = -60e3;
[problem_data, method_data] = init_potential (geometry, boundaries, interfaces, boundary_interfaces, voltage);
[geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data);

% plot the potential and the absolute value of the gradient
figure;
nsub_x = method_data.nsub(1);
nsub_y = method_data.nsub(2);
plot_potential (nsub_x, nsub_y, u, space, geometry);
figure;
plot_gradient (nsub_x, nsub_y, u, space, geometry);

% convergence study (with absolute error)
filename = 'photocathode_plain_degree=2_nsub=var';
figure;
plot_convergence_study (filename);
