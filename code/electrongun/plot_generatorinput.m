function [generatorinput] = plot_generatorinput (filename)
generatorinput = dlmread(filename);
r = generatorinput(:,1:3);
scatter3(r(:,3), r(:,2), r(:,1));
hold on;
ind_track = find(abs(generatorinput(:,10))==3);
scatter3(r(ind_track,3), r(ind_track,2), r(ind_track,1), 'r');
xlabel('z');ylabel('y');zlabel('x');
hold off;
view(2);
end
