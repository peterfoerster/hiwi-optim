clear all; close all; clc;
pkg load geopdes;

%% plot the geometry
geometry_file = 'photocathode_200kV_optim';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

% nsub = 8;
% ptcs = [6 7 8 9 12 13];
% bnds = [3 3 3 3  2  2];
% for iptc=1:length(ptcs)
%    hold on;
%    nrbctrlplot(geometry(ptcs(iptc)).boundary(bnds(iptc)).nurbs);
%    hold off;
% end

% for iptc=1:length(geometry)
%  for ibnd=1:length(geometry(iptc).boundary)
%   hold on;
%   filename = ['boundaries' num2str(iptc) num2str(ibnd) '.dat'];
%   nrbplot_dat(geometry(iptc).boundary(ibnd).nurbs, nsub, filename);
%   hold off;
%  end
% end

% width = 4;
% options.numbers = 1;
% options.boundary = 1;
% figure;
% %% manually choose to produce .dat in "nrbplot_surf"
% plot_geometry (geometry, nsub, width, options, boundaries);

%% solve for the potential
voltage = -200e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);
tic;
[geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data);
fprintf('\ntime elapsed for solution: %d min\n', toc/60);

%% plot the potential and the absolute value of the gradient
% figure;
% nsub_x = method_data.nsub(1);
% nsub_y = method_data.nsub(2);
% plot_potential (nsub_x, nsub_y, u, space, geometry);
% figure;
% modify this for geometry .dat files
% plot_gradient (nsub_x, nsub_y, u, space, geometry);

% sp_to_vtk (u, space, geometry, method_data.nsub, 'potential', 'u', 'value');
sp_to_vtk (u, space, geometry, method_data.nsub, ['gradient_optim_degree=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub)], '|E|', 'gradient');

%% convergence study (with absolute error)
% degree = 2;
% filename = 'photocathode_insulator_ref=5_degree=2_N_it=4';
% figure;
% plot_convergence_study (filename, degree);

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
