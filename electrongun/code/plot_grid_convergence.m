clear all; close all; clc;

folder = 'offaxis';
filename = 'offaxis';
N_it = 4;
degree = 2;
nsub = 8;
H = 0.001;
% choose base using the finest grid
base = 13200;
N_plot = 660;

h = NaN(N_it-1,1);
err = NaN(N_it-1,1);

% reference
dx = dy = 0.03*2^(-N_it);
dz = 0.1*2^(-N_it);
h_ref = sqrt(dy^2 + sqrt(dx^2 + dz^2));
trackname = [folder '/' filename '-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h_ref) '-H=' num2str(H) '.txt'];
r_ref = plot_track (trackname, N_plot);
r_ref = r_ref(1:base,:);
write_dat3D ([filename '-degree=' num2str(degree) '-nsub' num2str(nsub) '_ref.dat'], r_ref(1:N_plot:end,1), r_ref(1:N_plot:end,2), r_ref(1:N_plot:end,3));

for iit=0:N_it-1
  dx = dy = 0.03*2^(-iit);
  dz = 0.1*2^(-iit);
  h(iit+1) = sqrt(dy^2 + sqrt(dx^2 + dz^2));

  trackname = [folder '/' filename '-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h(iit+1)) '-H=' num2str(H) '.txt'];
  r = plot_track (trackname, N_plot);

  if (iit==0)
    r = r(1:2:2*base,:);
  else
    r = r(1:base,:);
  end

  err(iit+1) = norm(norm(r-r_ref, 2, 'rows')) / norm(norm(r_ref, 2, 'rows'));
  write_dat3D ([filename '-degree=' num2str(degree) '-nsub=' num2str(nsub) '_' num2str(iit+1) '.dat'], r(1:N_plot:end,1), r(1:N_plot:end,2), r(1:N_plot:end,3));
end
figure;
loglog(h, err, h, h.^3/h(1).^3*err(1));
xlabel('h as diagonal of cuboid');
ylabel('relative error');

write_dat ([filename '-degree=' num2str(degree) '-nsub' num2str(nsub) '_err.dat'], h, err);
write_dat ([filename '-degree=' num2str(degree) '-nsub' num2str(nsub) '_errh.dat'], h, h.^3/h(1).^3*err(1));
