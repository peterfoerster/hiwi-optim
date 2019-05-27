function [r] = plot_tracks (filename, N_probe)
  data = dlmread(filename);
  r = data(:,3:5);
  hold on;
  for iprt=1:N_probe
    scatter3(r(iprt:N_probe*300:end,1), r(iprt:N_probe*300:end,2), r(iprt:N_probe*300:end,3));
  end
  hold off;
  xlabel('z in [m]');
  ylabel('x in [mm]');
  zlabel('y in [mm]');
  view(3);
  r = [r(:,2)*1e-3 r(:,3)*1e-3 r(:,1)];
end
