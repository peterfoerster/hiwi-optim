% N_probe can be misused to scale the number of time steps
function [r] = plot_track (filename, N_probe)
  data = dlmread(filename);
  r = data(:,3:5);
  hold on;
  for iprobe=1:N_probe
    scatter(r(iprobe:N_probe:end,1), r(iprobe:N_probe:end,3)*1e-3);
  end
  hold off;
  xlabel('z in [m]');
  ylabel('\rho in [m]');
  view(2);
end
