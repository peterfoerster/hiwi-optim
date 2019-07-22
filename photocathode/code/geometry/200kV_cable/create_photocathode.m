% create the 2D photocathode geometry
pkg load nurbs;
% clear all; clf; clc;

filename = 'photocathode_200kV.txt';

cathode_boundary = create_cathodeboundary();

% hold on;
% for icrv=1:length(cathode_boundary)
%  nrbplot(cathode_boundary(icrv), 100);
% end
% hold off;

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

% cathode_inside = divide_cathode (cathode_boundary);
%
% hold on;
% for icrv=1:length(cathode_inside)
%  nrbplot(cathode_inside(icrv), 100);
% end
% hold off;
%
% ptcs_inside = create_ptcs_inside (cathode_boundary, cathode_inside);
%
% hold on;
% for icrv=1:length(ptcs_inside)
%   nrbkntplot(ptcs_inside(icrv));
% end
% hold off;
%
% [lift_inside] = divide_lift (cathode_boundary, vacuumchamber);
%
% hold on;
% for icrv=1:length(lift_inside)
%  nrbplot(lift_inside(icrv), 100);
% end
% hold off;
%
% ptcs_lift = create_ptcs_lift (cathode_boundary, lift_inside, vacuumchamber, cathode_inside);
%
% hold on;
% for icrv=1:length(ptcs_lift)
%  nrbkntplot(ptcs_lift(icrv));
% end
% hold off;

ptcs = create_ptcs (cathode_boundary, vacuumchamber, vacuumchamber_inside);

% hold on;
% for icrv=1:length(ptcs)
%   nrbkntplot(ptcs(icrv));
%   x = nrbeval(ptcs(icrv), {0.5,0.5});
%   text(x(1), x(2), num2str(icrv));
% end
% hold off;

write_geometryfile (ptcs, filename);
