clear all; close all; clc;
pkg load geopdes;

% degree = 2;
% N_it = 4;
% nquad_offset = 0;
% conv_study_sol (degree, N_it, nquad_offset);
% return

degree_ref = 2;
nsub_ref = 8;
nquad_offset_ref = 0;
degree = 1;
N_it = 3;
nquad_offset = 0;

conv_study_err (degree_ref, nsub_ref, nquad_offset_ref, degree, N_it, nquad_offset);

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
