% create the 2D photocathode geometry
pkg load nurbs;

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
p2 = [p2(1)-73.26e-3+10e-3 p2(2) 0];
crv(5) = nrbline(p1, p2);

% kink is missing information, how long is it?
% vertical
p1 = p2;
p2 = [p2(1) 20e-3 0];
crv(6) = nrbline(p1, p2);

% horizontal
p1 = p2;
p2 = [p2(1)-10e-3 p2(2) 0];
crv(7) = nrbline(p1, p2);

% vertical
p1 = p2;
p2 = [p2(1) 35e-3 0];
crv(8) = nrbline(p1, p2);

% back curvature
radius = 7.5e-3;
center = [p2(1) p2(2)+7.5e-3 0];
sang = pi/2;
eang = 3*pi/2;
crv(9) = nrbcirc(radius,center,sang,eang);

% horizontal
p1 = nrbeval(crv(9), 0);
p2 = nrbeval(crv(1), 1);
crv(10) = nrbline(p1, p2);

% inside is missing geometry information, where does the inner circle/straight lie?
% does the tapering angle remain the same?
% are only the light and dark red parts relevant or also the medium red (inverse geometry)

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
