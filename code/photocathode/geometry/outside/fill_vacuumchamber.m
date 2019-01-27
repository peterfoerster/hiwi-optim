function [vacuumchamber_inside] = fill_vacuumchamber (electrode_boundary, cathode, vacuumchamber)
% bottom front horizontal
p1 = nrbeval(cathode(1), 1);
p2 = nrbeval(vacuumchamber(1), 1);
vacuumchamber_inside(1) = nrbline(p1, p2);

p1 = nrbeval(cathode(2), 1);
p2 = nrbeval(vacuumchamber(2), 1);
vacuumchamber_inside(2) = nrbline(p1, p2);

p1 = nrbeval(electrode_boundary(1), 1);
p2 = nrbeval(vacuumchamber(3), 1);
vacuumchamber_inside(3) = nrbline(p1, p2);

% front diagonal
p1 = nrbeval(electrode_boundary(2), 1);
p2 = nrbeval(vacuumchamber(4), 1);
vacuumchamber_inside(4) = nrbline(p1, p2);

% top diagonal
p1 = nrbeval(electrode_boundary(3), 0);
p2 = nrbeval(vacuumchamber(5), 0);
vacuumchamber_inside(5) = nrbline(p1, p2);

% top back diagonal
p1 = nrbeval(electrode_boundary(4), 0);
p2 = nrbeval(vacuumchamber(6), 0);
vacuumchamber_inside(6) = nrbline(p1, p2);

% top back horizontal
p1 = nrbeval(vacuumchamber(7), 0);
p2 = nrbeval(electrode_boundary(5), 0);
vacuumchamber_inside(7) = nrbline(p1, p2);

% center back diagonal
p1 = nrbeval(vacuumchamber(8), 0);
p2 = nrbeval(electrode_boundary(6), 0);
vacuumchamber_inside(8) = nrbline(p1, p2);

% center vertical
p1 = nrbeval(cathode(3), 0);
p2 = nrbeval(electrode_boundary(7), 1);
vacuumchamber_inside(9) = nrbline(p1, p2);

% bottom back diagonal
p1 = nrbeval(vacuumchamber(8), 0);
p2 = nrbeval(cathode(4), 1);
vacuumchamber_inside(10) = nrbline(p1, p2);
end
