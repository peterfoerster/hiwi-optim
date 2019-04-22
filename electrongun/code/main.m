
return
%% plot grid and geometry
% options.numbers = 0;
% options.boundary = 0;
% figure;
% plot_geometry (geometry, boundaries, 5, 2, options);
% hold on;
% for iz=1:length(z)
%   scatter(z(iz)*ones(size(y)), y, 'k', 'o', 'filled');
% end
% hold off;

%% create particle distribution for astra
%% total charge in [nC]
%% total emission time T~7.5ns, how many bunches should be emitted
%% include timing spread inside the bunch?
%% emit uniformly distributed on cathode and then also normally with small sigma in front of the bunch, without timed factor
% T = 1e-3;
% nT = 1;
Q = -4;
N_prt = 1600;
rho_probe = [0.3 0.4 0.5 0.6 0.7];
mu = 0;
sigma = 0.4;
rho_bot = -1;
rho_top = 1;
inputname = 'electrongun.ini';
tic;
% implement space charge consistent emission?
% implement time dependent emission
% N_probe = generate_input_normal (Q, N_prt, rho_probe, mu, sigma, geometry, inputname);
N_probe = generate_input_uniform (Q, N_prt, rho_probe, rho_bot, rho_top, geometry, inputname);
% N_probe = generate_input_normal_emission (T, nT, Q, N_prt, rho_probe, mu, sigma, geometry, inputname);
% N_probe = generate_input_uniform_emission (T, nT, Q, N_prt, rho_probe, mu, sigma, geometry, inputname);
fprintf('\ncreated input in: %d s\n', toc);

% hold on;
% plot_input (inputname, N_probe);
% hold off;

%% create inputfile for astra
filename = 'electrongun.in';
% if no new fieldmap is created
cathode_start = 0;
beamtube_end = 1;
options.spacecharge = 1;
options.solenoid = 0;
create_astrainput (filename, inputname, cathode_start, beamtube_end, mapname, options);

tic;
[status, output] = system(['./Astra ' filename]);
fprintf('\nperformed tracking in: %d s\n', toc);
trackname = ['track_Q=' num2str(Q) '_N_prt=' num2str(N_prt) '_N_probe=' num2str(N_probe) '_spacecharge=' num2str(options.spacecharge) '.txt'];
[err, msg] = rename ('electrongun.track.001', trackname);
delete('electrongun.Log.001');
delete('NORRAN');

%% plot particle tracks
figure;
plot_track (trackname, N_probe);

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
