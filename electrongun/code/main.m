geometry_file = 'gun_half_long';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

% create particle distribution for astra
% total charge in [nC]
Q = -1;
N_prt = 100;
N_probe = 10;
% uniform or normal
distro = 'normal';
inputname = 'electrongun.ini';
% tic;
% generate_input (Q, N_prt, N_probe, geometry, inputname, distro)
% fprintf('\ncreated input in: %d s\n', toc);

% create inputfile for astra
filename = 'electrongun.in';
cathode_start = 0;
H_max = H_min = 0.001;
beamtube_end = 1;
mapname = 'DC-3D-degree=2-nsub=32-h=0.0808';
options.spacecharge = 1;
options.solenoid = 0;
create_astrainput (filename, inputname, cathode_start, H_max, H_min, beamtube_end, mapname, options);

tic;
[status, output] = system(['./Astra ' filename]);
fprintf('\nperformed tracking in: %d s\n', toc);
trackname = ['track_Q=' num2str(Q) '_N_prt=' num2str(N_prt) '_N_probe=' num2str(N_probe) '_distro=' distro '_spacecharge=' num2str(options.spacecharge) '.txt'];
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
