pkg load geopdes;

% geometry_file = 'v6_opt_order=3_run1';
geometry_file = 'geometry_v6';

[geometry] = mp_geo_load ([geometry_file '.txt']);

[problem_data, method_data] = setup_problem (geometry_file);
% tic;
% [geometry, msh, space, phi] = mp_solve_electrostatics (problem_data, method_data);
% fprintf('\n field solution %d min \n', toc/60);

% 4
nx = ny = 2^4;
% 6 gives 15 min, +1 gives *2 [min]
nz = 2^6;

fieldmapname = ['DC-3D-p=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1)) ...
                '_nx=ny=' num2str(nx) '_nz=' num2str(nz)];
if (exist([fieldmapname '.ex']) ~= 2)
   create_fieldmap (fieldmapname, nx, ny, nz, geometry, space, phi);
end

% 10
Ipart = 2^10;
% total charge in [nC]
Q_total = 100e-6;
% bunch length in [ns]
sig_clock = 30e-3;
generatorname = ['I=' num2str(Ipart) '_Q=' num2str(Q_total) '_sc=' num2str(sig_clock) '.in'];
if (exist(generatorname, 'file') ~= 2)
   write_generatorinput (generatorname, Ipart, Q_total, sig_clock, geometry);
   [status, output] = system(['./generator generator_' generatorname]);
   plot_generator (generatorname);
end
return
% time step in [ns]
% -11, [-8, -14]
iH = -11;
H = 2^iH;
sc       = 1;
% 4
Nrad     = 2^4;
Cell_var = 2^1;
% 4
Nlong_in = 2^4;
% filename = ['photogun_nx=ny=' num2str(nx) '_nz=' num2str(nz)];
% filename = ['photogun_H=' num2str(iH)];
filename = ['photogun_I=' num2str(Ipart) '_Nr=' num2str(Nrad) '_Cv=' num2str(Cell_var) ...
            '_Nl=' num2str(Nlong_in)];
if (exist(filename, 'file') ~= 2)
   write_astrainput ([filename '.in'], generatorname, fieldmapname, H, sc, Nrad, Cell_var, Nlong_in, geometry);
end
tic;
[status, output] = system(['./Astra ' filename '.in']);
fprintf('\n tracking %d min \n', toc/60);
delete([filename '.Log.001']);
delete([filename '.Zemit.001']);

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
return

[status, output] = system(['./lineplot ' filename]);
[status, output] = system(['./fieldplot ' filename]);

% space charge
nI_ref = 12;
nr_ref = 4;
nc_ref = 1;
nl_ref = 4;
nI_it  = [9 10 11 12];
nr_it  = [4];
nc_it  = [1];
nl_it  = [4];

nI_ref = 10;
nr_ref = 5;
nc_ref = 1;
nl_ref = 5;
nI_it  = [10];
nr_it  = [3 4 5];
nc_it  = [1];
nl_it  = [3 4 5];

[err_linf] = compute_sc_error (nI_ref, nr_ref, nc_ref, nl_ref, nI_it, nr_it, nc_it, nl_it);
plot_sc_error (nI_it, nr_it, nc_it, nl_it, err_linf);

% fieldmap
nx_ref = 4;
nz_ref = 8;
nx_it  = [4];
nz_it  = [4 5 6 7];

nx_ref = 6;
nz_ref = 6;
nx_it  = [3 4 5];
nz_it  = [6];

[err_l2, err_linf] = compute_map_error (nx_ref, nz_ref, nx_it, nz_it);
plot_map_error (nx_it, nz_it, err_l2, err_linf);

% integrator
H_ref = -14;
H_it  = [-8 -9 -10 -11 -12 -13 -14];
[err_linf] = compute_int_error (H_ref, H_it);
plot_int_error (H_it, err_linf);
