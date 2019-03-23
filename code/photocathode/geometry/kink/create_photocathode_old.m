% create the 2D photocathode geometry
pkg load nurbs;
clear all; clf; clc;

filename = 'photocathode_old.txt';

electrode_boundary = create_electrodeboundary();

hold on;
for icrv=1:length(electrode_boundary)
 nrbplot(electrode_boundary(icrv), 100);
end
hold off;

cathode = create_cathode (electrode_boundary);

hold on;
for icrv=1:length(cathode)
 nrbplot(cathode(icrv), 100);
end
hold off;
return
vacuumchamber = create_vacuumchamber_old (electrode_boundary, cathode);

%hold on;
%for icrv=1:length(vacuumchamber)
%  nrbplot(vacuumchamber(icrv), 100);
%end
%hold off;

vacuumchamber_inside = split_vacuumchamber (electrode_boundary, cathode, vacuumchamber);

%hold on;
%for icrv=1:length(vacuumchamber_inside)
%  nrbplot(vacuumchamber_inside(icrv), 100);
%end
%hold off;

outside_ptcs = create_outside_ptcs (electrode_boundary, cathode, vacuumchamber, vacuumchamber_inside);

hold on;
for icrv=1:length(outside_ptcs)
  nrbkntplot(outside_ptcs(icrv));
end
hold off;

write_geometryfile (outside_ptcs, filename);

% vacuumchamber is missing information
