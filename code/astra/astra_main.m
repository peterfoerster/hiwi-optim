pkg load geopdes;

geometry_file = 'geometry_v6';
[problem_data, method_data] = setup_problem (geometry_file);
tic;
[geometry, msh, space, phi] = mp_solve_electrostatics (problem_data, method_data);
fprintf('\nfield solution %d min\n', toc/60);

x_min = nrbeval(geometry(6).nurbs, [1 0]);
rho   = x_min(2)/sqrt(2);
z_min = x_min(1);
z_max = nrbeval(geometry(1).nurbs, [0 1]);
z_max = z_max(1);

nx = ny = 2^2;
nz = 2^4;
x = linspace(0, rho, nx);
y = linspace(0, rho, ny);
z = linspace(z_min, z_max, nz);

h = sqrt((rho/ny)^2 + sqrt((rho/nx)^2 + ((z_max-z_min)/nz)^2));
fieldmapname = ['DC-3D-degree=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1)) '_h=' num2str(h)];
create_fieldmap (fieldmapname, x, y, z, geometry, space, phi);

% create inputfile for astra
% further ones get appended
I_part  = 100;
N_probe = 16;
% in [nC]
Q = 100e-6;
generatorname = ['I_part=' num2str(I_part) '_Q=' num2str(Q) '.in'];
write_generatorinput (generatorname, I_part, Q, z_min);
[status, output] = system(['./generator generator_' generatorname]);
% plot input distribution
plot_generator (generatorname, geometry, z_min);

% in [ns]
H_max = 1e-2;
H_min = 1e-6;
options.spacecharge = 1;
filename = ['photogun_H_max=' num2str(H_max) '_H_min=' num2str(H_min) '_sc=' num2str(options.spacecharge)];
write_astrainput ([filename '.in'], generatorname, z_min, H_max, H_min, z_max, fieldmapname, options);
tic;
[status, output] = system(['./Astra ' filename '.in']);
fprintf('\ntracking %d min\n', toc/60);
return

% rms beam size?
plot_astra ([filename '.track.001'], geometry, N_probe);
[status, output] = system(['./lineplot ' filename]);
[status, output] = system(['./fieldplot ' filename]);
return

trackname = ['track_Q=' num2str(Q) '_N_prt=' num2str(N_prt) '_N_probe=' num2str(N_probe) ...
             '_distro=' distro '_spacecharge=' num2str(options.spacecharge) '.txt'];
[err, msg] = rename ('electrongun.track.001', trackname);
delete('electrongun.Log.001');

% plot particle tracks
figure;
plot_tracks (trackname, N_probe, 200);
% view(2);view(0,0);

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
