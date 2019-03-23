% create the 2D photocathode geometry
pkg load nurbs;
clear all; clf; clc;

filename = 'photocathode_insulator.txt';

cathode_boundary = create_cathodeboundary();

hold on;
for icrv=1:length(cathode_boundary)
 nrbplot(cathode_boundary(icrv), 100);
end
hold off;

vacuumchamber = create_vacuumchamber (cathode_boundary);

% hold on;
% for icrv=1:length(vacuumchamber)
%  nrbplot(vacuumchamber(icrv), 100);
% end
% hold off;

vacuumchamber_inside = divide_vacuumchamber (cathode_boundary, vacuumchamber);

% hold on;
% for icrv=1:length(vacuumchamber_inside)
%  nrbplot(vacuumchamber_inside(icrv), 100);
% end
% hold off;

outside_ptcs = create_outside_ptcs (cathode_boundary, vacuumchamber, vacuumchamber_inside);

hold on;
for icrv=1:length(outside_ptcs)
  nrbkntplot(outside_ptcs(icrv));
end
hold off;

write_geometryfile (outside_ptcs, filename);

% vacuumchamber is missing information
