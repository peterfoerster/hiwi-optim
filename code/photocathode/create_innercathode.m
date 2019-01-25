function [innercathode] = create_innercathode (cathode_boundary)
% inner cathode
p1 = [(100-9.79)*1e-3 0 0];
p2 = [p1(1) 9.8e-3 0];
innercathode(1) = nrbline(p1, p2);

% connection to upper cathode
p1 = [(100-9.79)*1e-3 9.8e-3 0];
p2 = nrbeval(cathode_boundary(1), 0);
innercathode(2) = nrbline(p1, p2);

% bottom horizontal
p1 = [(100-9.79)*1e-3 0 0];
p2 = [7.5e-3 0 0];
innercathode(3) = nrbline(p1, p2);

% left vertical
p1 = [7.5e-3 0 0];
p2 = [p1(1) 20e-3 0];
innercathode(4) = nrbline(p1, p2);

% horizontal
p1 = [7.5e-3 20e-3 0];
p2 = [(7.5+73.26)*1e-3 p1(2) 0];
innercathode(5) = nrbline(p1, p2);
end
