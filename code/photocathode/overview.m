pkg load geopdes;
%clear all; close all; clc;
addpath(genpath(pwd));

% plot the geometry
geometry_file = "photocathode.txt";
nsub = 100;
width = 4;
options.numbers = 0;
options.boundary = 1;
plot_geometry (geometry_file, nsub, width, options);
return
% solve for the potential
voltage = -60e3;
[problem_data, method_data] = init_potential_example (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data);

% plot the absolute value of the gradient
figure;
res_x = res_y = 50;
plot_potential (res_x, res_y, u, space, geometry);
