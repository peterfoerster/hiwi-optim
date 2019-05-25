clear all; close all; clc;

filename = 'centeraxis';
N_it = 4;
% choose base using the finest grid
base = 13200;
N_plot = 600;
h = NaN(N_it-1,1);
err = NaN(N_it-1,1);

% reference
trackname = 'track_grid_study-degree=2-nsub=32-h=0.0808-H=0.001.txt';
r_ref = plot_track (trackname, N_plot);
r_ref = r_ref(1:base,:); % manually choose the number of time steps
write_dat3D ([filename '_ref.dat'], r_ref(1:N_plot,1), r_ref(1:N_plot,2), r_ref(1:N_plot,3));

for iit=0:N_it-1
  dx = dy = 0.03*2^(-iit);
  dz = 0.1*2^(-iit);
  h(iit+1) = sqrt(dy^2 + sqrt(dx^2 + dz^2));

  % H(iit+1) = 2^(-iit);
  trackname = ['track_grid_study-degree=2-nsub=32-h=' num2str(h(iit+1)) '-H=0.001.txt'];
  % if (iit == 0)
  %   hold on;
  %   r = plot_track (trackname, 1600);
  %   hold off;
  %   r = r(1:2:base*2);
  % else
    hold on;
    r = plot_track (trackname, N_plot);
    hold off;
    r = r(1:base,:);
  % end
  % different length of time vector
  err(iit+1) = norm(norm(r-r_ref, 2, 'rows')) / norm(norm(r_ref, 2, 'rows'));
  write_dat3D ([filename '_' num2str(iit+1) '.dat'], r(1:N_plot,1), r(1:N_plot,2), r(1:N_plot,3));
end
figure;
loglog(h, err, h, h.^5/h(1).^5*err(1));
xlabel('h as diagonal of cuboid');
ylabel('relative error');

write_dat ([filename '_err.dat'], h, err);
write_dat ([filename '_err.dat'], h, h.^5/h(1).^5*err(1));
