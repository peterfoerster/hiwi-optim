% create the 2D photocathode geometry
pkg load nurbs;
clear all; clf; clc;

cathode_boundary = create_cathodeboundary();

hold on;
for icrv=1:length(cathode_boundary)
  nrbplot(cathode_boundary(icrv), 100);
end
hold off;
return

innercathode = create_innercathode (cathode_boundary);

box = create_cathodebox(cathode_boundary);

front_ptcs = fill_frontcathode(cathode_boundary);

back_ptcs = fill_backcathode(cathode_boundary);

hold on;
for icrv=1:length(innercathode)
  nrbplot(innercathode(icrv), 100);
end
hold off;

hold on;
for icrv=1:length(box)
  nrbplot(box(icrv), 100);
end
hold off;

hold on;
for icrv=1:length(back_ptcs)
  nrbplot(back_ptcs(icrv), 100);
end
hold off;

hold on;
for icrv=1:length(front_ptcs)
  nrbplot(front_ptcs(icrv), 100);
end
hold off;
