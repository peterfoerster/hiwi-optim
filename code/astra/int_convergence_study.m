clear all; close all; clc;
pkg load geopdes;

track = 'centeraxis';
r_prm = [0 0];
N_grid = 4;
folder = 'maps';
N_it = 6;
degree = 2;
nsub = 32;
voltage = 90e3;

geometry_file = 'gun_half_long';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);
dx = dy = 0.03*2^(-N_grid);
dz = 0.1*2^(-N_grid);
h = sqrt(dy^2 + sqrt(dx^2 + dz^2));

% convergence study
for iit=0:N_it
  % variable parameters
  H_max = 2^(-iit);

  mapname = [folder '/DC-3D-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h)];

  % particle distribution
  inputfilename = 'electrongun.ini';
  cathode = nrbrevolve(geometry(1).boundary(1).nurbs, [0 0 0], [1 0 0]);
  % if (iit==0)
  %   nrbkntplot(cathode);
  % end
  % x==2, y==3, z==1 from plot
  r_3D = nrbeval(cathode, {r_prm(1), r_prm(2)});
  r = [r_3D(2) r_3D(3) r_3D(1)];
  N_probe = 1;
  N_prt = 0;
  q = -1.602e-19;
  write_input (inputfilename, N_prt, N_probe, r, q);

  % create inputfile for astra
  filename = 'electrongun.in';
  cathode_start = 0;
  % set H_min=H_max to achieve consistent time step
  H_min = H_max;
  beamtube_end = 1;
  options.spacecharge = 0;
  options.solenoid = 0;
  create_astrainput (filename, inputfilename, cathode_start, H_max, H_min, beamtube_end, mapname, options);

  % tracking
  tic;
  [status, output] = system(['./Astra ' filename]);
  fprintf('\nperformed tracking in: %d s\n', toc);
  trackname = [track '-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h) '-H=' num2str(H_max) '.txt'];
  [err, msg] = rename ('electrongun.track.001', trackname);
  delete('electrongun.Log.001');
  % delete('NORRAN');

  r = plot_track (trackname, 1e4);
  size(r)
end

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
