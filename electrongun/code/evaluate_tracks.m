clear all; close all;
% choose N_t from total number of time steps
N_t = 300;
% where do these oscillations come from?
% particles start on 3D cathode so not all are given at a low z-values
% algorithm seems to do something weird to find values for them?
offset = 0;

Q = -1;
N_prt = 100;
N_probe = 10;
distro = 'normal';
options.spacecharge = 1;

trackname = ['track_Q=' num2str(Q) '_N_prt=' num2str(N_prt) '_N_probe=' num2str(N_probe) '_distro=' distro '_spacecharge=' num2str(options.spacecharge)];
r_out = plot_tracks ([trackname '.txt'], N_probe, N_t);

for iprt=1:N_probe
  r = r_out(iprt+offset*N_probe:N_probe-1:end,:);
  write_dat3D ([trackname '_' num2str(iprt) '.dat'], r(1:N_t:end,1), r(1:N_t:end,2), r(1:N_t:end,3));
end
