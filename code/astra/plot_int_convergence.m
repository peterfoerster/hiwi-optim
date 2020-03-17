clear all; close all; clc;

folder = 'int-study';
filename = 'centeraxis';
N_grid = 4;
N_it = 6;
degree = 2;
nsub = 32;
% choose base using the coarsest time step
base = 13;

H = NaN(N_it-1,1);
err = NaN(N_it-1,1);

dx = dy = 0.03*2^(-N_grid);
dz = 0.1*2^(-N_grid);
h = sqrt(dy^2 + sqrt(dx^2 + dz^2));
trackname = [folder '/' filename '-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h) '-H=' num2str(2^(-N_it)) '.txt'];
r_ref = plot_track (trackname, 2^N_it);
r_ref = r_ref(1:2^N_it:base*2^N_it,:);
write_dat3D ([filename '-h=' num2str(h) '-H=' num2str(2^(-N_it)) '_ref.dat'], r_ref(1:2^N_it:end,1), r_ref(1:2^N_it:end,2), r_ref(1:2^N_it:end,3));

for iit=0:N_it-1
  H(iit+1) = 2^(-iit);
  trackname = [folder '/' filename '-degree=' num2str(degree) '-nsub=' num2str(nsub) '-h=' num2str(h) '-H=' num2str(H(iit+1)) '.txt'];
  r = plot_track (trackname, 2^iit);
  r = r(1:2^iit:base*2^iit,:);

  err(iit+1) = norm(norm(r-r_ref, 2, 'rows')) / norm(norm(r_ref, 2, 'rows'));
  write_dat3D ([filename '-h=' num2str(h) '-H=' num2str(H(iit+1)) '.dat'], r_ref(1:2^iit:end,1), r_ref(1:2^iit:end,2), r_ref(1:2^iit:end,3));
end
figure;
loglog(H, err, H, H.^2*err(1));
xlabel('H in ns');
ylabel('relative error');

write_dat ([filename '-h=' num2str(h) '_err.dat'], H, err);
write_dat ([filename '-h=' num2str(h) '_errH.dat'], H, H.^2*err(1));
