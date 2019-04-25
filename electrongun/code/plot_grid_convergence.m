N_probe = 1;
N_it = 4;
Nz = 20*2^N_it; % no less than 20 grid points possible
% err = NaN(N_it,1);

% reference
trackname = ['tracks_field_study-Ny=4-Nz=' num2str(Nz) '-H=0.001.txt'];
r_ref = plot_track (trackname, N_probe);

for iit=0:N_it-1
  Nz = 20*2^iit;
  hold on;
  trackname = ['tracks_field_study-Ny=4-Nz=' num2str(Nz) '-H=0.001.txt'];
  r = plot_track (trackname, N_probe);
  hold off;
  % different length of time vector
  % err(iit+1) = norm(r-r_ref)/norm(r_ref);
end
legend('320', '20', '40', '80', '160');
