% create the 2D photocathode geometry
pkg load nurbs;
clear all;
clf;

filename = 'photocathode_200kV';

cathode_boundary = create_cathodeboundary();

% hold on;
% for icrv=1:length(cathode_boundary)
%  nrbplot(cathode_boundary(icrv), 20);
%  x = nrbeval(cathode_boundary(icrv), 0.5);
%  text(x(1), x(2), num2str(icrv));
% end
% hold off;

vacuumchamber = create_vacuumchamber (cathode_boundary);

% hold on;
% for icrv=1:length(vacuumchamber)
%  nrbplot(vacuumchamber(icrv), 20);
%  x = nrbeval(vacuumchamber(icrv), 0.5);
%  text(x(1), x(2), num2str(icrv));
% end
% hold off;

vacuumchamber_inside = divide_vacuumchamber (cathode_boundary, vacuumchamber);

% hold on;
% for icrv=1:length(vacuumchamber_inside)
%  nrbplot(vacuumchamber_inside(icrv), 20);
%  x = nrbeval(vacuumchamber_inside(icrv), 0.5);
%  text(x(1), x(2), num2str(icrv));
% end
% hold off;

ptcs = create_ptcs (cathode_boundary, vacuumchamber, vacuumchamber_inside);

hold on;
for iptc=1:length(ptcs)
  nrbkntplot(ptcs(iptc));
  x = nrbeval(ptcs(iptc), {0.5,0.5});
  text(x(1), x(2), num2str(iptc));
end
hold off;
return
write_geometryfile (ptcs, [filename '.txt']);

% deprecated
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cathode_inside = divide_cathode (cathode_boundary);

% hold on;
% for icrv=1:length(cathode_inside)
%  nrbplot(cathode_inside(icrv), 100);
% end
% hold off;

% ptcs_inside = create_ptcs_inside (cathode_boundary, cathode_inside);

% hold on;
% for icrv=1:length(ptcs_inside)
%   nrbkntplot(ptcs_inside(icrv));
%   x = nrbeval(ptcs_inside(icrv), {0.5,0.5});
%   text(x(1), x(2), num2str(icrv));
% end
% hold off;

% write_geometryinside (ptcs_inside, [filename '_inside.txt']);

% [lift_inside] = divide_lift (cathode_boundary, vacuumchamber);

% hold on;
% for icrv=1:length(lift_inside)
%  nrbplot(lift_inside(icrv), 100);
% end
% hold off;

% ptcs_lift = create_ptcs_lift (cathode_boundary, lift_inside, vacuumchamber, cathode_inside);

% hold on;
% for icrv=1:length(ptcs_lift)
%   nrbkntplot(ptcs_lift(icrv));
%   x = nrbeval(ptcs_lift(icrv), {0.5,0.5});
%   text(x(1), x(2), num2str(icrv));
% end
% hold off;

% write_geometryinside (ptcs_lift, [filename '_lift.txt']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
