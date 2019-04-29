clear all; clc;
pkg load geopdes;
pkg load statistics;

N_it = 4;
h = Nan(1,N_it+1);
geometry_file = 'gun_half_long';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

% convergence study
for iit=1:N_it
  % variable parameters
  dx = dy = 0.05*2^(-iit)
  dz = 0.15*2^(-iit);
  h = sqrt(dy^2 + sqrt(dx^2 + dz^2));
  H_max = 0.001;

  % create fieldmap for astra
  mapname = ['DC-3D-Ny=' num2str(Ny) '-Nz=' num2str(Nz)];
  if (exist([mapname '.ex']) == 0)
    voltage = 90e3;
    [ptcs] = set_ptcs (geometry_file);
    tic;
    [cathode_start, y, z] = create_fieldmap_study (mapname, geometry, boundaries, interfaces, boundary_interfaces, ptcs, voltage, Ny, Nz);
    fprintf('created fieldmap in: %d s\n', toc);
  end

  % particle distribution
  inputfilename = 'electrongun.ini';
  if (exist([inputfilename '.ex']) == 0)
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, 0.7}, 0, geometry(1).rdim);
    r = [0 r_2D(2) r_2D(1)];
    N_probe = 1;
    N_prt = 0;
    q = -1.602e-19;
    write_input (inputfilename, N_prt, N_probe, r, q);
  end

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
  trackname = ['track_grid_study-h=' num2str(h) '-H=' num2str(H_max) '.txt'];
  [err, msg] = rename ('electrongun.track.001', trackname);
  delete('electrongun.Log.001');
  delete('NORRAN');

  % plot particle tracks
  hold on;
  r_track = plot_track (trackname, 100);
  hold off;
end

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
