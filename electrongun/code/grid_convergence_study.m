clear all; close all; clc;
pkg load geopdes;
pkg load statistics;

N_it = 4;
degree = 2;
nsub = 32;
voltage = 90e3;

geometry_file = 'gun_half_long';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

% convergence study
for iit=0:N_it
  % variable parameters
  dx = dy = 0.03*2^(-iit); % 4 grid points minimum
  dz = 0.1*2^(-iit); % 20 grid points minimum
  h = sqrt(dy^2 + sqrt(dx^2 + dz^2));
  H_max = 0.001;

  % create fieldmap for astra
  mapname = ['DC-3D-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h)];
  if (exist([mapname '.ex']) == 0)
    ptcs = set_ptcs (geometry_file);
    tic;
    [cathode_start, x, y, z, E] = create_fieldmap_3D (mapname, geometry, boundaries, interfaces, boundary_interfaces, ptcs, voltage, degree, nsub, dx, dy, dz);
    fprintf('created fieldmap in: %d s\n', toc);
  end

  % particle distribution
  inputfilename = 'electrongun.ini';
  cathode = nrbrevolve(geometry(1).boundary(1).nurbs, [0 0 0], [1 0 0]);
  if (iit==0)
    nrbkntplot(cathode);
  end
  % x==2, y==3, z==1 from plot
  r_3D = nrbeval(cathode, {0, 0});
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
  trackname = ['track_grid_study-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h) '-H=' num2str(H_max) '.txt'];
  [err, msg] = rename ('electrongun.track.001', trackname);
  delete('electrongun.Log.001');
  delete('NORRAN');
end

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
