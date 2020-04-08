pkg load geopdes;

geometry_file = 'v6_opt_order=3_run1';
% geometry_file = 'geometry_v6';

% [geometry] = mp_geo_load ([geometry_file '.txt']);

[problem_data, method_data] = setup_problem (geometry_file);
tic;
[geometry, msh, space, phi] = mp_solve_electrostatics (problem_data, method_data);
fprintf('\n field solution %d min \n', toc/60);

% 3
nx = ny = 2^3;
% 6
nz = 2^6;

fieldmapname = ['DC-3D-p=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1)) ...
                '_nx=ny=' num2str(nx) '_nz=' num2str(nz)];
% if (exist([fieldmapname '.ex']) ~= 2)
   create_fieldmap (fieldmapname, nx, ny, nz, geometry, space, phi);
% end

% create inputfile for astra
Ipart = 2^7;
% total charge in [nC]
Q_total = 100e-6;
% bunch length in [ns]
sig_clock = 30e-3;
generatorname = ['I=' num2str(Ipart) '_Q=' num2str(Q_total) '_sc=' num2str(sig_clock) '.in'];
if (exist(generatorname, 'file') ~= 2)
   write_generatorinput (generatorname, Ipart, Q_total, sig_clock, geometry);
   [status, output] = system(['./generator generator_' generatorname]);
   % plot input
   plot_generator (generatorname);
end

% time step in [ns]
% 10
H = 2^(-10);
sc       = 0;
% number of grid cells
Nrad     = 2^4;
Cell_var = 2^1;
Nlong_in = 2^4;
filename = ['photogun_H=' num2str(H) '_nx=ny=' num2str(nx) '_nz=' num2str(nz)];
% filename = ['photogun'_sc=' num2str(sc) '_Nr=' num2str(Nrad) '_Cv=' num2str(Cell_var) ...
%             '_Nl=' num2str(Nlong_in)];
if (exist(filename, 'file') ~= 2)
   write_astrainput ([filename '.in'], generatorname, fieldmapname, H, sc, Nrad, Cell_var, Nlong_in, geometry);
end
tic;
[status, output] = system(['./Astra ' filename '.in']);
fprintf('\n tracking %d min \n', toc/60);
return

% for iH=1:length(H_it)
%    H = 2^H_it(iH)
%    filename = ['photogun_H=' num2str(H) '_sc=' num2str(sc) '_Nr=' num2str(Nrad) '_Cv=' num2str(Cell_var) ...
%                '_Nl=' num2str(Nlong_in)];
%    delete([filename '.Log.001']);
%    delete([filename '.ref.001']);
%    delete([filename '.Xemit.001']);
%    delete([filename '.Yemit.001']);
%    delete([filename '.Zemit.001']);
% end

% plot rms beam size, emittance
nx_ref = 3;
nz_ref = 7;
nx_it = [3 4 6];
nz_it = [6 6 6];
[err_l2, err_linf] = plot_beam (nx_ref, nz_ref, nx_it, nz_it);

% emittance, rms beam size
nz_ref = 5;
nz_it = [3 4];
nx_it = [3 4];
[l1_err, l2_err, linf_err] = compute_emit_error (nz_ref, nz_it, nx_it);
[l1_err, l2_err, linf_err] = compute_beam_error (nz_ref, nz_it, nx_it);

% fieldmap
nz_ref = 6;
nz_it = [3 4 5];
nx_it = [3 4];
[l1_err, l2_err, linf_err] = compute_map_error (nz_ref, nz_it, nx_it);
plot_map_error (nz_it, nx_it, l1_err, l2_err, linf_err);
return
% integrator
% H_ref = 2^(-16);
% H_it  = -15:-4;
% [l1_err, l2_err, linf_err] = compute_int_error (H_ref, H_it, sc, Nrad, Cell_var, Nlong_in);
% plot_int_error (H_ref, H_it, l1_err, l2_err, linf_err);

% rms beam size?
plot_astra ([filename '.track.001'], geometry);
[status, output] = system(['./lineplot ' filename]);
[status, output] = system(['./fieldplot ' filename]);
return

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
