clear all; close all; clc;
pkg load geopdes;

% plot the geometry
geometry_file = 'inhomogeneous_square.txt';
nsub = 100;
width = 4;
options.numbers = 1;
options.boundary = 1;
figure;
plot_geometry (geometry_file, nsub, width, options);

% solve for the potential
voltage = -60e3;
[problem_data, method_data] = init_potential_example (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data);

% plot the potential and the absolute value of the gradient
figure;
res_x = res_y = 50;
plot_potential (res_x, res_y, u, space, geometry);
figure;
plot_gradient (res_x, res_y, u, space, geometry);
