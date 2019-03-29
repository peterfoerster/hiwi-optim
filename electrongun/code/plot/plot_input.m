function [] = plot_input (filename, iprobe)
  generatorinput = dlmread(filename);
  r = generatorinput(:,1:3);
  scatter(r(:,3), r(:,2));
  hold on;
  scatter(r(iprobe,3), r(iprobe,2), 'r');
  xlabel('z');
  ylabel('y');
  hold off;
  view(2);
end
