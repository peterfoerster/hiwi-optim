% check if rectangle can be inscribed
r = 10e-3;
x = @(phi) r*cos(phi);
y = @(phi) r*sin(phi);
phi = linspace(0, 2*pi, 2^5);
% circle
plot(x(phi), y(phi));
%
% h = r - sqrt(r^2 - 7.5^2);
%
% hold on;
% plot([-7.5 7.5], [r-h r-h]);
% plot([-7.5 -7.5], [-r+h r-h]);
% hold off;
% return
% hold on;
% % rectangle
% x_1 = x((pi-s/r)/2);
% y_1 = y((pi-s/r)/2);
% x_2 = x((pi+s/r)/2);
% y_2 = y((pi+s/r)/2);

x  = 7.5e-3;
r  = 10e-3;
phi = acos(x/r);
hold on;
plot([r*cos(phi) r*cos(pi-phi)], [r*sin(phi) r*sin(phi)]);
hold off;
