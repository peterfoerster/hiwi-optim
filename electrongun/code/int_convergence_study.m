clear all; close all; clc;
pkg load geopdes;
pkg load statistics;

N_it = 6;
geometry_file = 'gun_half_long';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

% convergence study
for iit=0:N_it
  % variable parameters
  H_max = 2^(-iit);

  % create fieldmap for astra
  mapname = 'DC-3D-h=0.22897';

  % particle distribution
  inputfilename = 'electrongun.ini';
  cathode = nrbrevolve(geometry(1).boundary(1).nurbs, [0 0 0], [1 0 0]);
  % if (iit==0)
  %   nrbkntplot(cathode);
  % end
  % x==2, y==3, z==1
  r_3D = nrbeval(cathode, {0.7, 0.7});
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
  trackname = ['track_int_study-h=0.22897-H=' num2str(H_max) '.txt'];
  [err, msg] = rename ('electrongun.track.001', trackname);
  delete('electrongun.Log.001');
  delete('NORRAN');

  % plot particle tracks
  hold on;
  r_track = plot_track (trackname, 1);
  size(r_track)
  hold off;
  view(3);
end

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
