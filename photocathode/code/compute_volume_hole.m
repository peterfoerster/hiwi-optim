% figure out z-value from original geometry
% fixed parameters for hole or variable?
function [V] = compute_volume_hole (r, np)
% np = 2^3; % choose individually for each direction?
% r = 35e-3/2;

% write wrapper for quadrature rule

y = @(z) ones(size(z)); % regular cylinder with height 1
% y = @(z) cos(z); % from nrbeval
% y = @(z) 1 + 0.2*z.^2.*sin(z); % Abele's test case

x = @(z) sqrt(r^2 - z^2);

[qp, qw] = grule(np);
qw_z     = diff(z)/2*qw;
qp_z     = diff(z)/2*(qp+1) + z(1);
V = 0;

for iz=1:length(qp_z)
   z = nrbeval(nurbs, [qp_z 0]);
   z_par = nrbreverse(nurbs, z);

  Ix = [0 x(qp_z(iz))];
  y = nrbeval(nurbs, [z_par 1]);
  Iy = [0 y(qp_z(iz))];

  qw_x     = diff(Ix)/2*qw;
  qw_y     = diff(Iy)/2*qw;
  [wx, wy] = meshgrid(qw_x, qw_y);

  V = V + qw_z(iz)*sum(sum(wx.*wy));
end

V = 2*V;
end

% test quadrature weights
% [p1, w1] = gauleg(17.45,13.2,10)
% % computes for [-1 1], so scale with factor to obtain correct weights
% [p2, w2] = grule(10)
%
% % this yields the correct weights
% (13.2-17.45)/2*w2 - w1'
% % and the correct points
% p2 = (13.2-17.45)/2*(p2+1) + 17.45;
% p2-p1'
