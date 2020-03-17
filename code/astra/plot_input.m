function [] = plot_input (filename, N_probe)
  generatorinput = dlmread(filename);
  r = generatorinput(:,1:3);

  scatter(r(1:N_probe,3), r(1:N_probe,2), 'r');
  hold on;
  scatter(r(N_probe+1:end,3), r(N_probe+1:end,2));
  xlabel('z');
  ylabel('y');
  hold off;
  view(2);
end
