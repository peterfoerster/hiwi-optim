function [r, x_0, y_0, phi_l, phi_u] = compute_circle (r_l, r_u, s_l, s_u)
   phi_l = -acot(s_l);
   phi_u = -acot(s_u);

   r = (r_l(1) - r_u(1)) / (cos(phi_l) - cos(phi_u));

   x_0 = r_l(1) - r*cos(phi_l);
   y_0 = r_l(2) - r*sin(phi_l);
end
