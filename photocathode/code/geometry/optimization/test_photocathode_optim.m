clear all; clf; clc;
pkg load geopdes;

filename = 'photocathode_200kV_optim_order=4';
order  = 4;
N_ctrl = 13*(order-2) - 2;
x      = zeros(N_ctrl,1);

% test individual control points
% x(3)  = -0.005;
% x(7)  = -0.005;
% x(8)  = 0.005;
% x(9)  = -0.005;
% x(10) = 0.005;
% order=4
% x(17) = 0.005;
% order=5
% x(23) = 0.005;

create_photocathode_optim (filename, x, order);
