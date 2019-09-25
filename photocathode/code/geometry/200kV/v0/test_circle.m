phi_s = 67.5*pi/180;
s_1 = -tan(pi - phi_s);

% correct slope
% x = 1:10;
% plot(x, s_1*x);
% axis('equal');

phi_1 = -acot(s_1);
phi_2 = -acot( (59.9-65)/(188-113.1) );

r_1 = [201.8 37.8];
r_2 = [188 59.9];
r = (r_1(1) - r_2(1)) / (cos(phi_1) - cos(phi_2))

x_0 = r_1(1) - r*cos(phi_1)
y_0 = r_1(2) - r*sin(phi_1)

c_1 = r*[cos(phi_1) sin(phi_1)] + [x_0 y_0]
c_2 = r*[cos(phi_2) sin(phi_2)] + [x_0 y_0]

circle = nrbcirc(r, [x_0 y_0], phi_1, phi_2);

nrbplot(circle, 100)
