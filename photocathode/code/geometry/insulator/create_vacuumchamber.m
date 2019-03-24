function [vacuumchamber] = create_vacuumchamber (cathode_boundary)
% bottom front vertical
p1 = [200e-3 0];
p2 = nrbeval(cathode_boundary(1), 1);
p2 = [p1(1) p2(2)];
vacuumchamber(1) = nrbline(p1, p2);

p1 = nrbeval(vacuumchamber(1), 1);
p2 = nrbeval(cathode_boundary(2), 1);
p2 = [p1(1) p2(2)];
vacuumchamber(2) = nrbline(p1, p2);

% top front vertical
p1 = nrbeval(vacuumchamber(2), 1);
p2 = [p1(1) 150e-3 0];
vacuumchamber(3) = nrbline(p1, p2);

% top front horizontal
p1 = nrbeval(cathode_boundary(4), 0);
p2 = nrbeval(vacuumchamber(3), 1);
p1 = [p1(1) p2(2)];
vacuumchamber(4) = nrbline(p1, p2);

% top back horizontal
p1 = [-50e-3 150e-3 0];
p2 = nrbeval(vacuumchamber(4), 0);
vacuumchamber(5) = nrbline(p1, p2);

% top back vertical
p1 = nrbeval(cathode_boundary(6), 0);
p2 = nrbeval(vacuumchamber(5), 0);
p1 = [p2(1) p1(2)];
vacuumchamber(6) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(8), 0);
p2 = nrbeval(vacuumchamber(6), 0);
p1 = [p2(1) p1(2)];
vacuumchamber(7) = nrbline(p1, p2);

% take mean to avoid sharp corner
% this makes correctly modeling the insulator impossible
% maybe in the case statement of the permittivity function
p1 = nrbeval(cathode_boundary(8), 0);
p3 = nrbeval(cathode_boundary(15), 0);
p2 = nrbeval(vacuumchamber(7), 0);
p1 = [p2(1) (p1(2)+p3(2))/2];
vacuumchamber(8) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(15), 0);
p2 = nrbeval(vacuumchamber(8), 0);
p1 = [p2(1) p1(2)];
vacuumchamber(9) = nrbline(p1, p2);

% bottom back vertical
p1 = [-50e-3 0];
p2 = nrbeval(vacuumchamber(9), 0);
vacuumchamber(10) = nrbline(p1, p2);

% bottom back horizontal
p1 = nrbeval(vacuumchamber(10), 0);
p2 = nrbeval(cathode_boundary(16), 0);
vacuumchamber(11) = nrbline(p1, p2);

% bottom front horizontal
p1 = nrbeval(cathode_boundary(1), 0);
p2 = nrbeval(vacuumchamber(1), 0);
vacuumchamber(12) = nrbline(p1, p2);
end
