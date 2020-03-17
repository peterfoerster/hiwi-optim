function [electrode_boundary] = create_electrodeboundary_v4 ()
   % photoelectrode
   p1 = [190e-3 0];
   p2 = [p1(1) 5e-3];
   electrode_boundary(1) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(1), 1);
   p2 = [190.5e-3 9.9e-3];
   electrode_boundary(2) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(2), 1);
   p2 = [194.7e-3 20e-3];
   electrode_boundary(3) = nrbline(p1, p2);

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
   electrode_boundary(5) = nrbcirc(radius, center, sang, eang);

   sang = (phi_u+phi_l)/2;
   eang = phi_u;
   electrode_boundary(6) = nrbcirc(radius, center, sang, eang);
   electrode_boundary(6) = nrbreverse(electrode_boundary(6));

   % front connection with photoelectrode
   p1 = nrbeval(electrode_boundary(3), 1);
   p2 = nrbeval(electrode_boundary(5), 0);
   electrode_boundary(4) = nrbline(p1, p2);

   % back curve
   radius = 10e-3;
   center = [113e-3 55e-3];
   sang = pi/2;
   eang = pi;
   electrode_boundary(10) = nrbcirc(radius, center, sang, eang);
   electrode_boundary(10) = nrbreverse(electrode_boundary(10));

   sang = pi;
   eang = 3*pi/2;
   electrode_boundary(11) = nrbcirc(radius, center, sang, eang);
   electrode_boundary(11) = nrbreverse(electrode_boundary(11));

   % top diagonal
   p1 = nrbeval(electrode_boundary(10), 1);
   p2 = nrbeval(electrode_boundary(6), 0);
   a  = (p2(2)-p1(2))/(p2(1)-p1(1));
   b  = p1(2) - a*p1(1);
   f = @(x) a*x + b;

   p1 = [181.5e-3 f(181.5e-3)];
   p2 = nrbeval(electrode_boundary(6), 0);
   electrode_boundary(7) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(10), 1);
   p2 = [146.5e-3 f(146.5e-3)];
   electrode_boundary(9) = nrbline(p1, p2);

   % holes
   p1 = nrbeval(electrode_boundary(9), 1);
   p2 = nrbeval(electrode_boundary(7), 0);
   electrode_boundary(8) = nrbline(p1, p2);

   % insulator connection
   p1 = [100e-3 45e-3];
   p2 = nrbeval(electrode_boundary(11), 0);
   electrode_boundary(12) = nrbline(p1, p2);

   p1 = [100e-3 35e-3];
   p2 = nrbeval(electrode_boundary(12), 0);
   electrode_boundary(13) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(13), 0);
   p2 = [110e-3 35e-3];
   electrode_boundary(14) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(14), 1);
   p2 = [130e-3 35e-3];
   electrode_boundary(15) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(15), 1);
   p2 = [130e-3 45e-3];
   electrode_boundary(16) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(12), 1);
   p2 = nrbeval(electrode_boundary(16), 1);
   electrode_boundary(17) = nrbline(p1, p2);

   % lift
   p1 = nrbeval(electrode_boundary(17), 1);
   p2 = [185e-3 45e-3];
   electrode_boundary(18) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(16), 0);
   p2 = nrbeval(electrode_boundary(18), 1);
   p1 = [p2(1) p1(2)];
   electrode_boundary(19) = nrbline(p1, p2);

   p1 = [185e-3 30e-3];
   p2 = nrbeval(electrode_boundary(19), 0);
   electrode_boundary(20) = nrbline(p1, p2);

   p1 = [185e-3 20e-3];
   p2 = nrbeval(electrode_boundary(20), 0);
   electrode_boundary(21) = nrbline(p1, p2);

   p1 = [125e-3 20e-3];
   p2 = nrbeval(electrode_boundary(21), 0);
   electrode_boundary(22) = nrbline(p1, p2);

   % cable connection
   p1 = nrbeval(electrode_boundary(22), 0);
   p2 = [125e-3 21e-3];
   electrode_boundary(23) = nrbline(p1, p2);

   p1 = [75e-3 21e-3];
   p2 = nrbeval(electrode_boundary(23), 1);
   electrode_boundary(24) = nrbline(p1, p2);

   p1 = [75e-3 10e-3];
   p2 = nrbeval(electrode_boundary(24), 0);
   electrode_boundary(25) = nrbline(p1, p2);

   p1 = [75e-3 0];
   p2 = nrbeval(electrode_boundary(25), 0);
   electrode_boundary(26) = nrbline(p1, p2);
end
