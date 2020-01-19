function [r, x0, phi1, phi2] = compute_circle_mod (x1, x2, dx1, dx2)
   % account for quadrant of unit circle
   phi1 = pi-acot(dx1);
   phi2 = 2*pi-acot(dx2);
   r = (x1(1) - x2(1)) / (cos(phi1) - cos(phi2));
   x0 = [x2(1) - r*cos(phi2), x2(2) - r*sin(phi2)];
end
