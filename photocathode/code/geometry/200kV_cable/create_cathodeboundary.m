function [cathode_boundary] = create_cathodeboundary ()
  % photocathode
  p1 = [190e-3 0];
  p2 = [p1(1) 5e-3];
  cathode_boundary(1) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(1), 1);
  p2 = [190.5e-3 9.9e-3];
  cathode_boundary(2) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(2), 1);
  p2 = [194.7e-3 20e-3];
  cathode_boundary(3) = nrbline(p1, p2);

  % front top curve
  % lower point and slope
  r_l = [201.8e-3 37.8e-3];
  phi_l = 67.5*pi/180;
  s_l = -tan(pi - phi_l);
  % upper point and slope
  r_u = [188e-3 59.9e-3];
  s_u = (59.9-65)/(188-113.1);

  [radius, x_0, y_0, phi_l, phi_u] = compute_circle (r_l, r_u, s_l, s_u);
  center = [x_0 y_0];
  sang = phi_l;
  eang = (phi_u+phi_l)/2;
  cathode_boundary(5) = nrbcirc(radius, center, sang, eang);

  sang = (phi_u+phi_l)/2;
  eang = phi_u;
  cathode_boundary(6) = nrbcirc(radius, center, sang, eang);
  cathode_boundary(6) = nrbreverse(cathode_boundary(6));

  % front connection with photocathode
  p1 = nrbeval(cathode_boundary(3), 1);
  p2 = nrbeval(cathode_boundary(5), 0);
  cathode_boundary(4) = nrbline(p1, p2);

  % back curve
  radius = 10e-3;
  center = [113e-3 55e-3];
  sang = pi/2;
  eang = pi;
  cathode_boundary(8) = nrbcirc(radius, center, sang, eang);
  cathode_boundary(8) = nrbreverse(cathode_boundary(8));

  sang = pi;
  eang = 3*pi/2;
  cathode_boundary(9) = nrbcirc(radius, center, sang, eang);
  cathode_boundary(9) = nrbreverse(cathode_boundary(9));

  % top diagonal
  p1 = nrbeval(cathode_boundary(8), 1);
  p2 = nrbeval(cathode_boundary(6), 0);
  cathode_boundary(7) = nrbline(p1, p2);

  % insulator connection
  p1 = [100e-3 45e-3];
  p2 = nrbeval(cathode_boundary(9), 0);
  cathode_boundary(10) = nrbline(p1, p2);

  p1 = [100e-3 35e-3];
  p2 = nrbeval(cathode_boundary(10), 0);
  cathode_boundary(11) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(11), 0);
  p2 = [110e-3 35e-3];
  cathode_boundary(12) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(12), 1);
  p2 = [130e-3 35e-3];
  cathode_boundary(13) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(13), 1);
  p2 = [130e-3 45e-3];
  cathode_boundary(14) = nrbline(p1, p2);

  % connection to electrode
  p1 = nrbeval(cathode_boundary(10), 1);
  p2 = nrbeval(cathode_boundary(14), 1);
  cathode_boundary(15) = nrbline(p1, p2);

  % connection to lift
  p1 = nrbeval(cathode_boundary(15), 1);
  p2 = [185e-3 45e-3];
  cathode_boundary(16) = nrbline(p1, p2);

  p1 = [185e-3 20e-3];
  p2 = nrbeval(cathode_boundary(16), 1);
  cathode_boundary(17) = nrbline(p1, p2);

  % cable connection
  p1 = [125e-3 20e-3];
  p2 = nrbeval(cathode_boundary(17), 0);
  cathode_boundary(18) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(18), 0);
  p2 = [125e-3 21e-3];
  cathode_boundary(19) = nrbline(p1, p2);

  p1 = [75e-3 21e-3];
  p2 = nrbeval(cathode_boundary(19), 1);
  cathode_boundary(20) = nrbline(p1, p2);

  p1 = [75e-3 10e-3];
  p2 = nrbeval(cathode_boundary(20), 0);
  cathode_boundary(21) = nrbline(p1, p2);

  p1 = [0 10e-3];
  p2 = nrbeval(cathode_boundary(21), 0);
  cathode_boundary(22) = nrbline(p1, p2);

  p1 = [75e-3 0];
  p2 = nrbeval(cathode_boundary(21), 0);
  cathode_boundary(23) = nrbline(p1, p2);
end
