% create the 2D photocathode geometry
pkg load nurbs;
clf;
filename = 'photocathode_200kV_v6';

electrode = create_electrode_v6();

hold on;
for icrv=1:length(electrode)
 nrbplot(electrode(icrv), 20);
 x = nrbeval(electrode(icrv), 0.5);
 text(x(1), x(2), num2str(icrv));
end
hold off;

anode_ring = create_anodering_v6();

hold on;
for icrv=1:length(anode_ring)
 nrbplot(anode_ring(icrv), 20);
 x = nrbeval(anode_ring(icrv), 0.5);
 text(x(1), x(2), num2str(icrv));
end
hold off;

inner_insulator = create_innerinsulator_v6();

hold on;
for icrv=1:length(inner_insulator)
 nrbplot(inner_insulator(icrv), 20);
 x = nrbeval(inner_insulator(icrv), 0.5);
 text(x(1), x(2), num2str(icrv));
end
hold off;

outer_insulator = create_outerinsulator_v6();

hold on;
for icrv=1:length(outer_insulator)
 nrbplot(outer_insulator(icrv), 20);
 x = nrbeval(outer_insulator(icrv), 0.5);
 text(x(1), x(2), num2str(icrv));
end
hold off;

vacuumchamber = create_vacuumchamber_v6 (anode_ring, electrode, outer_insulator);

hold on;
for icrv=1:length(vacuumchamber)
 nrbplot(vacuumchamber(icrv), 20);
 x = nrbeval(vacuumchamber(icrv), 0.5);
 text(x(1), x(2), num2str(icrv));
end
hold off;
return

vacuumchamber_inside = divide_vacuumchamber_v5 (electrode, vacuumchamber);

% hold on;
% for icrv=1:length(vacuumchamber_inside)
%  nrbplot(vacuumchamber_inside(icrv), 20);
%  x = nrbeval(vacuumchamber_inside(icrv), 0.5);
%  text(x(1), x(2), num2str(icrv));
% end
% hold off;

ptcs = create_ptcs_v5 (electrode, vacuumchamber, vacuumchamber_inside);

hold on;
for iptc=1:length(ptcs)
  nrbkntplot(ptcs(iptc));
  x = nrbeval(ptcs(iptc), {0.5,0.5});
  text(x(1), x(2), num2str(iptc));
end
hold off;
return
write_geometryfile_v5 (ptcs, [filename '.txt']);
