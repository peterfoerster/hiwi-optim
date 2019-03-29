close all;
pkg load geopdes;

% plot the geometry
% short, long
geometry_file = 'gun_half_long';
nsub = 100;
width = 4;
options.numbers = 1;
options.boundary = 1;
figure;
[geometry] = plot_geometry (geometry_file, nsub, width, options);
axis([0 0.1 -0.1 0.1]);

% solve for the potential
voltage = 90e3;
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

% create 3D fieldmap for astra
% choose number of physical coordinates with z as longitudinal axis
% Nx = 5;
% Ny = 5;
% Nz = 5;
% create_fieldmap (geometry_file, voltage, Nx, Ny, Nz);

% create 2D fieldmap for astra
% choose number of physical coordinates with z as longitudinal axis
% only gives field in the x-z plane thus no Nx required
% maybe increase resolution at cathode and reduce it for beamtube
% Ny = 10;
% Nz = 100;
% tic;
% [geometry] = create_fieldmap_2D (geometry_file, voltage, Ny, Nz);
% fprintf('created fieldmap in: %d s', toc);

% create particle distribution for astra
% it seems I need more particles emitted on the outside part of the cathode
% or constant emission over timespan
% total charge in [nC]
Q = -4;
N_prt = 10*12*4; % needs to be divisible by 12 for modified version
N_probe = 6;
iprobe = [10 30 50 70 90 110]*4;
filename = 'electrongun.ini';
tic;
% implement space charge consistent emission? (1)
% emission over a given time span probably won't produce better results
% possibly emit morge particles at the outside of the cathode then inside to
% achieve the desired output, is this cheating or related to (1)?
% maybe it is best to use a normal distribution
% this may provide what I need instead of the uniform one right now
generate_input_mod (Q, N_prt, N_probe, iprobe, geometry, filename);
fprintf('\ncreated input in: %d s\n', toc);

hold on;
plot_input (filename, iprobe);
hold off;

% create inputfile for astra
filename = 'electrongun.in';
options.spacecharge = 1;
options.solenoid = 0;
create_astrainput (filename, options);

tic;
[status, output] = system(['./Astra ' filename]);
fprintf('performed tracking in: %d s\n', toc);
filename = ['track_N_prt=' num2str(N_prt) '_N_probe=' num2str(N_probe) '_spacecharge=' num2str(options.spacecharge) '.txt'];
[err, msg] = rename ('electrongun.track.001', filename);

% plot particle tracks
figure;
plot_track (filename, N_probe);

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
