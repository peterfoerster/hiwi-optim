function [cathode] = create_cathode (electrode_boundary)
% photocathode
p1 = [(100-9.79)*1e-3 0 0];
p2 = [p1(1) 9.8e-3 0];
cathode(1) = nrbline(p1, p2);

% connection to electrode
p1 = [(100-9.79)*1e-3 9.8e-3 0];
p2 = nrbeval(electrode_boundary(1), 0);
cathode(2) = nrbline(p1, p2);

% top horizontal
p1 = [7.5e-3 20e-3 0];
p2 = nrbeval(electrode_boundary(9), 0);
cathode(3) = nrbline(p1, p2);

%back vertical
p1 = [7.5e-3 0 0];
p2 = nrbeval(cathode(3), 0);
cathode(4) = nrbline(p1, p2);

% bottom back horizontal
p1 = nrbeval(cathode(4), 0);
p2 = nrbeval(cathode(1), 0);
cathode(5) = nrbline(p1, p2);
end
