clear all; clf; clc;
pkg load geopdes;

filename = 'photocathode_200kV_optim';
order  = 3;
N_ctrl = 13*(order-2) - 2;
x      = zeros(N_ctrl,1);

% test individual control points
x(3)  = -0.005;
x(7)  = -0.005;
x(8)  = 0.005;
x(9)  = -0.005;
x(10) = 0.005;
% order=4
% x(17) = 0.005;
% order=5
% x(23) = 0.005;

ptcs = create_photocathode_optim (filename, x, order);
return
hold on;
for iptc=1:length(ptcs)
   nrbkntplot(ptcs(iptc));
   x = nrbeval(ptcs(iptc), {0.5,0.5});
   text(x(1), x(2), num2str(iptc));
end
hold off;
