clear all; close all; clc;

N_it = 6;
% choose a base using the coarsest time step
base = 14;
H = NaN(N_it-1,1);
err = NaN(N_it-1,1);

% reference
trackname = 'track_int_study-h=0.22897-H=0.015625.txt';
r_ref = plot_track (trackname, 2^N_it);
r_ref = r_ref(1:base*2^N_it);

for iit=0:N_it-1
  H(iit+1) = 2^(-iit);
  trackname = ['track_int_study-h=0.22897-H=' num2str(H(iit+1)) '.txt'];
  hold on;
  r = plot_track (trackname, 2^iit);
  hold off;
  r = r(1:base*2^iit);

  % different length of time vector
  err(iit+1) = norm(r-r_ref(1:2^(N_it-iit):end))./norm(r_ref(1:2^(N_it-iit):end));
end
figure;
plot(log(H), log(err), log(H), log(H.^2)+log(err(1)));
xlabel('H in ns');
ylabel('relative error');
