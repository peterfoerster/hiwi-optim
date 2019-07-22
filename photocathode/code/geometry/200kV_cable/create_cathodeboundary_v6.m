function [cathode_boundary] = create_cathodeboundary ()
  % photocathode
  p1 = [224.5e-3 0];
  p2 = [p1(1) 5e-3];
  cathode_boundary(1) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(1), 1);
  p2 = [225e-3 9.9e-3];
  cathode_boundary(2) = nrbline(p1, p2);

  % front top curve
  radius = 14.46e-3;
  center = [228.8e-3-radius 21.73*1e-3];
  sang = 3*pi/2 + 67.5/180*pi;
  eang = pi/4;
  cathode_boundary(4) = nrbcirc(radius, center, sang, eang);

  % front connection with photocathode
  p1 = nrbeval(cathode_boundary(2), 1);
  p2 = nrbeval(cathode_boundary(4), 0);
  cathode_boundary(3) = nrbline(p1, p2);

  sang = pi/4;
  eang = pi/2;
  cathode_boundary(5) = nrbcirc(radius, center, sang, eang);
  cathode_boundary(5) = nrbreverse(cathode_boundary(4));

  % back curve
  radius = 7.5e-3;
  center = [130e-3 25e-3+radius];
  sang = pi/2;
  eang = pi;
  cathode_boundary(7) = nrbcirc(radius, center, sang, eang);
  cathode_boundary(7) = nrbreverse(cathode_boundary(7));

  sang = pi;
  eang = 3*pi/2;
  cathode_boundary(8) = nrbcirc(radius, center, sang, eang);
  cathode_boundary(8) = nrbreverse(cathode_boundary(8));

  % top horizontal
  p1 = nrbeval(cathode_boundary(7), 1);
  p2 = nrbeval(cathode_boundary(5), 0);
  cathode_boundary(6) = nrbline(p1, p2);

  % cable connection
  % p1 = [74e-3 0];
  % p2 = [p1(1) 10e-3];
  % cathode_boundary(9) = nrbline(p1, p2);
  %
  % p1 = nrbeval(cathode_boundary(1), 1);
  % p2 = [179.2e-3 p1(2)];
  % cathode_boundary(2) = nrbline(p1, p2);
  %
  % % lift
  % p1 = nrbeval(cathode_boundary(2), 1);
  % p2 = [p1(1) 20e-3];
  % cathode_boundary(3) = nrbline(p1, p2);
  %
  % p1 = nrbeval(cathode_boundary(3), 1);
  % p2 = [130e-3 p1(2)];
  % cathode_boundary(4) = nrbline(p2, p1);
  %
  % % insulator connection
  % p1 = nrbeval(cathode_boundary(4), 0);
  % p2 = [p1(1) 15e-3];
  % cathode_boundary(5) = nrbline(p2, p1);
  %
  % p1 = nrbeval(cathode_boundary(5), 0);
  % p2 = [105e-3 p1(2)];
  % cathode_boundary(6) = nrbline(p2, p1);
end
