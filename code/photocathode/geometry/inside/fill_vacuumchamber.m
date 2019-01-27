function [vacuumchamber_ptcs] = fill_vacuumchamber (electrode_boundary, cathode, vacuumchamber)
% bottom front horizontal
p1 = nrbeval(cathode(1),1);
p2 = nrbeval(vacuumchamber(1),1);
vacuumchamber_ptcs(1) = nrbline(p1, p2);

p1 = nrbeval(cathode(2),1);
p2 = nrbeval(vacuumchamber(2),1);
vacuumchamber_ptcs(2) = nrbline(p1, p2);

p1 = nrbeval(electrode_boundary(1),1);
p2 = nrbeval(vacuumchamber(3),1);
vacuumchamber_ptcs(3) = nrbline(p1, p2);

p1 = nrbeval(electrode_boundary(2),1);
p2 = nrbeval(vacuumchamber(4),1);
vacuumchamber_ptcs(4) = nrbline(p1, p2);

% top front diagonal
p1 = nrbeval(electrode_boundary(3),1);
p2 = nrbeval(vacuumchamber(5),1);
vacuumchamber_ptcs(5) = nrbline(p1, p2);

% top front vertical
p1 = nrbeval(electrode_boundary(4),0);
p2 = nrbeval(vacuumchamber(6),0);
vacuumchamber_ptcs(6) = nrbline(p1, p2);

p1 = nrbeval(electrode_boundary(5),0);
p2 = nrbeval(vacuumchamber(7),0);
vacuumchamber_ptcs(7) = nrbline(p1, p2);

% top back diagonal
p1 = nrbeval(electrode_boundary(6),1);
p2 = nrbeval(vacuumchamber(8),0);
vacuumchamber_ptcs(8) = nrbline(p1, p2);

% top back horizontal
p1 = nrbeval(electrode_boundary(7),1);
p2 = nrbeval(vacuumchamber(9),0);
vacuumchamber_ptcs(9) = nrbline(p1, p2);

% center back diagonal
p1 = nrbeval(vacuumchamber(10),0);
p2 = nrbeval(electrode_boundary(8),1);
vacuumchamber_ptcs(10) = nrbline(p1, p2);

% center vertical
p1 = nrbeval(cathode(4),1);
p2 = nrbeval(electrode_boundary(8),1);
vacuumchamber_ptcs(11) = nrbline(p1, p2);

% bottom back diagonal
p1 = nrbeval(vacuumchamber(11),0);
p2 = nrbeval(cathode(4),1);
vacuumchamber_ptcs(12) = nrbline(p1, p2);

p1 = nrbeval(vacuumchamber(12),0);
p2 = nrbeval(cathode(5),1);
vacuumchamber_ptcs(13) = nrbline(p1, p2);
end
