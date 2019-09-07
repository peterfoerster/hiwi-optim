% function [e_V] = compute_volume_test (np)
np = 1;
% write wrapper for quadrature rule
z = [-2 5]; % from nrbeval

r = @(z) 4*ones(size(z)); % regular cylinder with height 1

[qp, qw] = grule(np);
qw_z     = diff(z)/2*qw;
qp_z     = diff(z)/2*(qp+1) + z(1);
V = 0;

for iz=1:length(qp_z)
  Ir = [0 r(qp_z(iz))];

  qw_r     = diff(Ir)/2*qw;
  qp_r     = diff(Ir)/2*(qp+1) + Ir(1);

  V = V + qw_z(iz)*sum(qp_r.*qw_r);
end

V = 2*pi*V;
e_V = (V-7*4^2*pi)/(7*4^2*pi)
% end

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
