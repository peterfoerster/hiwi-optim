function [r] = plot_track (filename, N_t)
  data = dlmread(filename);
  r = data(:,3:5);
  scatter3(r(1:N_t:end,1), r(1:N_t:end,2), r(1:N_t:end,3));
  xlabel('z in [m]');
  ylabel('x in [mm]');
  zlabel('y in [mm]');
  view(3);
  r = [r(:,2)*1e-3 r(:,3)*1e-3 r(:,1)];
end
