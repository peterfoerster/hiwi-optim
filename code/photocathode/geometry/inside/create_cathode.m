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
p2 = nrbeval(electrode_boundary(11), 0);
cathode(3) = nrbline(p1, p2);

% bottom back vertical
p1 = [7.5e-3 0 0];
p2 = nrbeval(cathode(1), 1);
p2 = [p1(1) p2(2)];
cathode(5) = nrbline(p1, p2);

% top back vertical
p1 = nrbeval(cathode(5), 1);
p2 = nrbeval(cathode(3), 0);
cathode(4) = nrbline(p1, p2);

% bottom back horizontal
p1 = nrbeval(cathode(5), 0);
p2 = nrbeval(cathode(3), 1);
p2 = [p2(1) p1(2)];
cathode(6) = nrbline(p1, p2);

% bottom front horizontal
p1 = nrbeval(cathode(6), 1);
p2 = nrbeval(cathode(1), 0);
cathode(7) = nrbline(p1, p2);
end
