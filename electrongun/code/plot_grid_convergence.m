clear all; close all; clc;

N_it = 4;
% choose base using the finest grid
base = 13200;
h = NaN(N_it-1,1);
err = NaN(N_it-1,1);

% reference
trackname = 'track_grid_study-h=0.0808-H=0.001.txt';
r_ref = plot_track (trackname, 800);
r_ref = r_ref(1:base); % manually choose the number of time steps

for iit=0:N_it-1
  dx = dy = 0.03*2^(-iit);
  dz = 0.1*2^(-iit);
  h(iit+1) = sqrt(dy^2 + sqrt(dx^2 + dz^2));

  H(iit+1) = 2^(-iit);
  trackname = ['track_grid_study-h=' num2str(h(iit+1)) '-H=0.001.txt'];
  if (iit == 0)
    hold on;
    r = plot_track (trackname, 1600);
    hold off;
    r = r(1:2:base*2);
  else
    hold on;
    r = plot_track (trackname, 800);
    hold off;
    r = r(1:base);
  end
  % different length of time vector
  err(iit+1) = norm(r-r_ref)./norm(r_ref);
end
figure;
plot(log(h), log(err), log(h), log(h.^3)-log(h(1).^3)+log(err(1)));
xlabel('h as diagonal of cuboid');
ylabel('relative error');
