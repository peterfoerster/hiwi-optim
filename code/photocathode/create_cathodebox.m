function [box] = create_cathodebox (cathode_boundary)
% need surrounding box for the field
p1 = [-50e-3 0 0];
p2 = [150e-3 0 0];
box(1) = nrbline(p1, p2);

p1 = [150e-3 0 0];
p2 = [p1(1) 100e-3 0];
box(2) = nrbline(p1, p2);

p1 = [150e-3 100e-3 0];
p2 = [-50e-3 p2(2) 0];
box(3) = nrbline(p1, p2);

p1 = [-50e-3 100e-3 0];
p2 = [-50e-3 0 0];
box(4) = nrbline(p1, p2);
end
