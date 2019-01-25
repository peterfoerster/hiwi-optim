%OUTPUT:
% crv: struct containing the outer photocathode_boundary starting in the bottom right
%      ordered counterclockwise
function [cathode_boundary] = create_cathodeboundary ()

radius = 14.46e-3;
center = [100e-3-radius 35.54*1e-3 0];
sang = 3*pi/2 + 67.5/180*pi;
eang = pi/4;
cathode_boundary(2) = nrbcirc(radius,center,sang,eang);

radius = 14.46e-3;
center = [100e-3-radius 35.54*1e-3 0];
sang = pi/4;
eang = pi/2;
cathode_boundary(3) = nrbcirc(radius,center,sang,eang);

p1 = [(100-(92.5-73.26-14))*1e-3 20e-3 0];
p2 = nrbeval(cathode_boundary(2), 0);
cathode_boundary(1) = nrbline(p1, p2);

p1 = [7.5*1e-3 50e-3 0];
p2 = nrbeval(cathode_boundary(2), 1);
cathode_boundary(4) = nrbline(p1, p2);

%radius = 7.5e-3;
%center = [7.5e-3 (35+7.5)*1e-3 0];
%sang = pi/2;
%eang = 3*pi/2;
%cathode_boundary(5) = nrbcirc(radius,center,sang,eang);
%
%p1 = [7.5*1e-3 35e-3 0];
%p2 = [(7.5+73.26)*1e-3 35e-3 0];
%cathode_boundary(6) = nrbline(p1, p2);
%
%p1 = [(7.5+73.26)*1e-3 20e-3 0];
%p2 = [(7.5+73.26)*1e-3 35e-3 0];
%cathode_boundary(7) = nrbline(p1, p2);
%
%p1 = [(7.5+73.26)*1e-3 20e-3 0];
%p2 = [(7.5+73.26+14)*1e-3 20e-3 0];
%cathode_boundary(8) = nrbline(p1, p2);
%end
