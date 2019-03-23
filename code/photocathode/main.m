clear all; close all; clc;
pkg load geopdes;

% plot the geometry
% plain, kink, insulator
geometry_file = 'photocathode_plain.txt';
nsub = 100;
width = 4;
options.numbers = 1;
options.boundary = 1;
figure;
plot_geometry (geometry_file, nsub, width, options);

% solve for the potential
voltage = -60e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);

% plot the potential and the absolute value of the gradient
figure;
res_x = res_y = 50;
plot_potential (res_x, res_y, u, space, geometry);
figure;
% why does this not work for the insulator case
plot_gradient (res_x, res_y, u, space, geometry);
