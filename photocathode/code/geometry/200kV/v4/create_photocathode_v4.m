% create the 2D photocathode geometry
pkg load nurbs;
clear all; clf;

filename = 'photocathode_200kV_v4';

electrode_boundary = create_electrodeboundary_v4();

% hold on;
% for icrv=1:length(electrode_boundary)
%  nrbplot(electrode_boundary(icrv), 20);
%  x = nrbeval(electrode_boundary(icrv), 0.5);
%  text(x(1), x(2), num2str(icrv));
% end
% hold off;

vacuumchamber = create_vacuumchamber_v4 (electrode_boundary);

% hold on;
% for icrv=1:length(vacuumchamber)
%  nrbplot(vacuumchamber(icrv), 20);
%  x = nrbeval(vacuumchamber(icrv), 0.5);
%  text(x(1), x(2), num2str(icrv));
% end
% hold off;

vacuumchamber_inside = divide_vacuumchamber_v4 (electrode_boundary, vacuumchamber);

% hold on;
% for icrv=1:length(vacuumchamber_inside)
%  nrbplot(vacuumchamber_inside(icrv), 20);
%  x = nrbeval(vacuumchamber_inside(icrv), 0.5);
%  text(x(1), x(2), num2str(icrv));
% end
% hold off;

ptcs = create_ptcs_v4 (electrode_boundary, vacuumchamber, vacuumchamber_inside);

hold on;
for iptc=1:length(ptcs)
  nrbkntplot(ptcs(iptc));
  x = nrbeval(ptcs(iptc), {0.5,0.5});
  text(x(1), x(2), num2str(iptc));
end
hold off;

write_geometryfile_v4 (ptcs, [filename '.txt']);
