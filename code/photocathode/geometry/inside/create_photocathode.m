% create the 2D photocathode geometry
pkg load nurbs;
clear all; clf; clc;

electrode_boundary = create_electrodeboundary();

hold on;
for icrv=1:length(electrode_boundary)
  nrbplot(electrode_boundary(icrv), 100);
end
hold off;

%electrode_ptcs = fill_electrode(electrode_boundary);
%
%hold on;
%for icrv=1:length(electrode_ptcs)
%  nrbplot(electrode_ptcs(icrv), 100);
%end
%hold off;

%[ptcs] = create_electrode_ptcs (electrode_boundary, electrode_ptcs);
%hold on;
%for iptc=1:length(ptcs)
%  nrbkntplot(ptcs(iptc));
%end
%hold off;

cathode = create_cathode (electrode_boundary);

hold on;
for icrv=1:length(cathode)
  nrbplot(cathode(icrv), 100);
end
hold off;

%cathode_ptcs = fill_cathode(cathode);
%
%hold on;
%for icrv=1:length(cathode_ptcs)
%  nrbplot(cathode_ptcs(icrv), 100);
%end
%hold off;

vacuumchamber = create_vacuumchamber(electrode_boundary, cathode);

hold on;
for icrv=1:length(vacuumchamber)
  nrbplot(vacuumchamber(icrv), 100);
end
hold off;

vacuumchamber_ptcs = fill_vacuumchamber (electrode_boundary, cathode, vacuumchamber);

hold on;
for icrv=1:length(vacuumchamber_ptcs)
  nrbplot(vacuumchamber_ptcs(icrv), 100);
end
hold off;

% kink at the back of the electrode is missing information
% vacuumchamber is missing information

% otherwise should only need to form patches now
% electrode and cathode are on high potential
% vacuumchamber is grounded
% do I even need to model their inside then?

% maybe there's a need for different epsilon
% if the insulator at the back of the electrode needs to be considered
