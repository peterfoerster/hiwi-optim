% create the 2D photocathode geometry
pkg load nurbs;
clear all; clf; clc;

cathode = create_uppercathode();

crv = fill_uppercathode(cathode);

hold on;
for icrv=1:length(cathode)
  nrbplot(cathode(icrv), 100);
end
hold off;

hold on;
for icrv=1:length(crv)
  nrbkntplot(crv(icrv));
end
hold off;
return
return

% filling the front curvature
% bottom
p1 = nrbeval(cathode(6), 1);
p2 = nrbeval(cathode(1), 1);
crv(1) = nrbline(p1, p2);

p2 = nrbeval(cathode(2), 4/11);
p1 = nrbeval(cathode(7), 4/5);
p1 = [p1(1) p2(2)];
crv(2) = nrbline(p1, p2);

p1 = nrbeval(cathode(5), 1);
p2 = nrbeval(crv(2), 0);
crv(3) = nrbline(p1, p2);

% top
p2 = nrbeval(cathode(2), 1);
p1 = nrbeval(cathode(2), 7/11);
p1 = [p2(1) p1(2)];
crv(4) = nrbline(p1, p2);

p1 = nrbeval(crv(4), 0);
p2 = nrbeval(crv(2), 0);
crv(5) = nrbline(p1, p2);

% left bottom
p1 = nrbeval(cathode(5), 1);
p2 = nrbeval(crv(2), 1);
p2 = [p1(1) p2(2)];
crv(6) = nrbline(p1, p2);

% left center
p1 = nrbeval(crv(4), 0);
p2 = nrbeval(crv(2), 0);
crv(7) = nrbline(p1, p2);

p1 = nrbeval(crv(5), 0);
p2 = nrbeval(crv(6), 1);
crv(8) = nrbline(p1, p2);

% left top
p1 = nrbeval(crv(6), 1);
p2 = nrbeval(cathode(2), 1);
p2 = [p1(1) p2(2)]
crv(9) = nrbline(p1, p2);

%p1 = nrbeval(crv(1), 8/11);
%p2 = nrbeval(crv(1), 8/13);
%p3 = nrbeval(crv(3), 2/5);
%p2 = [p3(1) p2(2)];
%crv(2) = nrbline(p1, p2);

% upper cathode curvature
radius = 14.46e-3;
center = [100e-3-radius 35.54*1e-3 0];
sang = 3*pi/2 + 67.5/180*pi;
eang = pi/2;
crv(1) = nrbcirc(radius,center,sang,eang);

% upper cathode angled section
p1 = nrbeval(crv(1), 0);
p2 = [(100-(92.5-73.26-14))*1e-3 20e-3 0];
crv(2) = nrbline(p1, p2);

% horizontal
p1 = p2;
p2 = [p2(1)-14e-3 p2(2) 0];
crv(3) = nrbline(p1, p2);

% vertical
p1 = p2;
p2 = [p2(1) 35e-3 0];
crv(4) = nrbline(p1, p2);

% horizontal
p1 = p2;
p2 = [p2(1)-73.26e-3 p2(2) 0];
crv(5) = nrbline(p1, p2);

% back curvature
radius = 7.5e-3;
center = [p2(1) p2(2)+7.5e-3 0];
sang = pi/2;
eang = 3*pi/2;
crv(6) = nrbcirc(radius,center,sang,eang);

% horizontal
p1 = nrbeval(crv(6), 0);
p2 = nrbeval(crv(1), 1);
crv(7) = nrbline(p1, p2);

% filling the front curvature

p1 = nrbeval(crv(1), 4/11);
p2 = nrbeval(crv(1), 5/13);
p3 = nrbeval(crv(3), 1/5);
p2 = [p3(1) p2(2)];
crv(14) = nrbline(p1, p2);

p1 = nrbeval(crv(1), 8/11);
p2 = nrbeval(crv(1), 8/13);
p3 = nrbeval(crv(3), 2/5);
p2 = [p3(1) p2(2)];
crv(15) = nrbline(p1, p2);

% left
p1 = nrbeval(crv(4), 1);
p2 = nrbeval(crv(1), 1);
crv(20) = nrbline(p1, p2);

p1 = nrbeval(crv(20), 3/4);
p2 = nrbeval(crv(15), 1);
crv(21) = nrbline(p1, p2);

% center
p1 = nrbeval(crv(14), 1);
p2 = nrbeval(crv(15), 1);
crv(19) = nrbline(p1, p2);

% bottom part
p1 = nrbeval(crv(14), 1);
p2 = nrbeval(crv(4), 1);
crv(16) = nrbline(p1, p2);

p1 = nrbeval(crv(14), 1);
p2 = nrbeval(crv(4), 1);
crv(17) = nrbline(p1, p2);

p1 = nrbeval(crv(4), 1);
p2 = nrbeval(crv(1), 0);
crv(18) = nrbline(p1, p2);

% kink is missing length info
%% vertical
%p1 = p2;
%p2 = [p2(1) 20e-3 0];
%crv(6) = nrbline(p1, p2);
%
%% horizontal
%p1 = p2;
%p2 = [p2(1)-10e-3 p2(2) 0];
%crv(7) = nrbline(p1, p2);
%
%% vertical
%p1 = p2;
%p2 = [p2(1) 35e-3 0];
%crv(8) = nrbline(p1, p2);

% filling the back curvature
p1 = nrbeval(crv(6), 3/11);
p2 = nrbeval(crv(6), 1/3);
p3 = nrbeval(crv(6), 1/7);
p2 = [p3(1) p2(2)];
crv(8) = nrbline(p1, p2);

p1 = nrbeval(crv(6), 8/11);
p2 = nrbeval(crv(6), 2/3);
p3 = nrbeval(crv(6), 6/7);
p2 = [p3(1) p2(2)];
crv(9) = nrbline(p1, p2);

p1 = nrbeval(crv(9), 1);
p2 = nrbeval(crv(8), 1);
crv(10) = nrbline(p1, p2);

% vertical cut
p1 = nrbeval(crv(7), 0);
p2 = [p1(1) 35e-3];
crv(11) = nrbline(p1, p2);

p1 = nrbeval(crv(11), 1/4);
p2 = nrbeval(crv(8), 1);
crv(12) = nrbline(p1, p2);

p1 = nrbeval(crv(11), 3/4);
p2 = nrbeval(crv(9), 1);
crv(13) = nrbline(p1, p2);

% inner part
p1 = [(100-9.79)*1e-3 0 0];
p2 = [p1(1) 9.8e-3 0];
crv(8) = nrbline(p1, p2);

% inner angled section
p1 = p2;
p2 = nrbeval(crv(2), 1);
crv(9) = nrbline(p1, p2);

% horizontal tube
p1 = [(100-9.79)*1e-3 0 0];
p2 = [7.5e-3 0 0];
crv(10) = nrbline(p1, p2);

% vertical
p1 = p2;
p2 = [p1(1) 20e-3 0];
crv(11) = nrbline(p1, p2);

% horizontal
p1 = p2;
p2 = [(7.5+73.26)*1e-3 p1(2) 0];
crv(12) = nrbline(p1, p2);

% need surrounding box for the field
p1 = [-50e-3 0 0];
p2 = [150e-3 0 0];
crv(13) = nrbline(p1, p2);

p1 = p2;
p2 = [p2(1) 100e-3 0];
crv(14) = nrbline(p1, p2);

p1 = p2;
p2 = [-50e-3 p2(2) 0];
crv(15) = nrbline(p1, p2);

p1 = p2;
p2 = [-50e-3 0 0];
crv(16) = nrbline(p1, p2);

hold on;
for icrv=1:length(crv)
  nrbkntplot(crv(icrv));
end
hold off;

% old version
%% upper left circle
%radius = 14.46e-3;
%center = [radius 35.54*1e-3 0];
%sang = pi/2;
%eang = 3*pi/2 - 67.5/180*pi;
%crv(1) = nrbcirc(radius,center,sang,eang);
%
%% angled
%p1 = nrbeval(crv(1), 1);
%p2 = [(92.5-73.26-14)*1e-3 20e-3 0];
%crv(2) = nrbline(p1, p2);
%
%% horizontal
%p1 = p2;
%p2 = [p2(1)+14e-3 p2(2) 0];
%crv(3) = nrbline(p1, p2);
%
%% vertical
%p1 = p2;
%p2 = [p2(1) 35e-3 0];
%crv(4) = nrbline(p1, p2);
%
%% horizontal
%p1 = p2;
%p2 = [p2(1)+73.26e-3 p2(2) 0];
%crv(5) = nrbline(p1, p2);
%
%% upper right circle
%radius = 7.5e-3;
%center = [p2(1) p2(2)+7.5e-3 0];
%sang = -pi/2;
%eang = pi/2;
%crv(6) = nrbcirc(radius,center,sang,eang);
%
%% horizontal
%p1 = nrbeval(crv(6), 1);
%p2 = nrbeval(crv(1), 0);
%crv(7) = nrbline(p1, p2);
