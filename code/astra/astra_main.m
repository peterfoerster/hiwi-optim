pkg load geopdes;

% geometry_file = 'v6_opt_order=3_run1';
geometry_file = 'geometry_v6';

[geometry] = mp_geo_load ([geometry_file '.txt']);
[problem_data, method_data] = setup_problem (geometry_file);
% tic;
% [geometry, msh, space, phi] = mp_solve_electrostatics (problem_data, method_data);
% fprintf('\n field solution %d min \n', toc/60);

% number of particles (10 [8:13])
Ipart = 2^10;
% total charge in [nC]
Q_total = 100e-6;
% sigma bunch length in [ns]
% 5 ps for 1e-3 (shows sc effect for individual trajectories)
% 30 ps for 5e-3
sig_clock = 5e-3;

generatorname = ['I=' num2str(Ipart) '_Q=' num2str(Q_total) '_sc=' num2str(sig_clock) '.in'];
if (exist(generatorname, 'file') ~= 2)
   write_generatorinput (generatorname, Ipart, Q_total, sig_clock, geometry);
   [status, output] = system(['./generator generator_' generatorname]);
   plot_generator (generatorname);
end

% number of transverse grid points 4
nx = ny = 2^4;
% number of longitudinal grid points 6
nz = 2^6;
fieldmapname = ['DC-3D-p=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1)) ...
                '_nx=ny=' num2str(nx) '_nz=' num2str(nz)];
if (exist([fieldmapname '.ex']) ~= 2)
   create_fieldmap (fieldmapname, nx, ny, nz, geometry, space, phi);
end

% time step in [ns] (-11 [-13:-8])
iH = -11;
H = 2^iH;

% space charge
sc       = 1;
% number of radial cells 4
Nrad     = 2^4;
% size factor between innermost and outermost radial cell
Cell_var = 2^1;
% number of longitudinal cells 4
Nlong_in = 2^4;

% filename = ['photogun_H=' num2str(iH)];
% filename = ['photogun_nx=ny=' num2str(nx) '_nz=' num2str(nz)];
% filename = ['photogun_I=' num2str(Ipart) '_Nr=' num2str(Nrad) '_Cv=' num2str(Cell_var) ...
%             '_Nl=' num2str(Nlong_in)];
filename = ['photogun'];
if (exist(filename, 'file') ~= 2)
   write_astrainput ([filename '.in'], generatorname, fieldmapname, H, sc, Nrad, Cell_var, Nlong_in, geometry);
end
tic;
[status, output] = system(['./Astra ' filename '.in']);
fprintf('\n tracking %d min \n', toc/60);
delete('NORRAN');
delete([filename '.Log.001']);
% delete([filename '.track.001']);
delete([filename '.Zemit.001']);
delete('win_config.dat');

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
return

plot_astra (filename);
[status, output] = system(['./lineplot ' filename]);
[status, output] = system(['./fieldplot ' filename]);
