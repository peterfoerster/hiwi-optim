function [vacuumchamber] = create_vacuumchamber (cathode_boundary)
% bottom front vertical
p1 = [373e-3 0];
p2 = nrbeval(cathode_boundary(1), 1);
p2 = [p1(1) p2(2)];
vacuumchamber(1) = nrbline(p1, p2);

p1 = nrbeval(vacuumchamber(1), 1);
p2 = nrbeval(cathode_boundary(2), 1);
p2 = [p1(1) p2(2)];
vacuumchamber(2) = nrbline(p1, p2);

p1 = nrbeval(vacuumchamber(2), 1);
p2 = nrbeval(cathode_boundary(3), 1);
p2 = [p1(1) p2(2)];
vacuumchamber(3) = nrbline(p1, p2);

p1 = nrbeval(vacuumchamber(3), 1);
p2 = nrbeval(cathode_boundary(4), 1);
p2 = [p1(1) p2(2)];
vacuumchamber(4) = nrbline(p1, p2);

% top front vertical
p1 = nrbeval(vacuumchamber(4), 1);
p2 = [373e-3 112e-3];
vacuumchamber(5) = nrbline(p1, p2);

% top front horizontal
p1 = nrbeval(cathode_boundary(6), 0);
p2 = nrbeval(vacuumchamber(5), 1);
p1 = [p1(1) p2(2)];
vacuumchamber(6) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(7), 0);
p2 = nrbeval(vacuumchamber(6), 0);
p1 = [p1(1) p2(2)];
vacuumchamber(7) = nrbline(p1, p2);

% holes
p1 = nrbeval(cathode_boundary(8), 0);
p2 = nrbeval(vacuumchamber(7), 0);
p1 = [p1(1) p2(2)];
vacuumchamber(8) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(9), 0);
p2 = nrbeval(vacuumchamber(8), 0);
p1 = [p1(1) p2(2)];
vacuumchamber(9) = nrbline(p1, p2);

% top back horizontal
p1 = [0 112e-3];
p2 = nrbeval(vacuumchamber(9), 0);
vacuumchamber(10) = nrbline(p1, p2);

% top back vertical
p1 = nrbeval(cathode_boundary(11), 1);
p2 = nrbeval(vacuumchamber(10), 0);
p1 = [0 (112e-3+p1(2))/2];
vacuumchamber(11) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(13), 1);
p2 = nrbeval(vacuumchamber(11), 0);
p1 = [0 p1(2)];
vacuumchamber(12) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(13), 0);
p2 = nrbeval(vacuumchamber(12), 0);
p1 = [p2(1) p1(2)];
vacuumchamber(13) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(23), 1);
p2 = nrbeval(vacuumchamber(13), 0);
p1 = [p2(1) p1(2)];
vacuumchamber(14) = nrbline(p1, p2);

p1 = [0 16e-3];
p2 = nrbeval(vacuumchamber(14), 0);
vacuumchamber(15) = nrbline(p1, p2);

p1 = nrbeval(cathode_boundary(23), 0);
p2 = nrbeval(vacuumchamber(15), 0);
p1 = [p2(1) p1(2)];
vacuumchamber(16) = nrbline(p1, p2);

% bottom back vertical
p1 = [0 0];
p2 = nrbeval(vacuumchamber(16), 0);
vacuumchamber(17) = nrbline(p1, p2);

% bottom back horizontal
p1 = nrbeval(vacuumchamber(17), 0);
p2 = nrbeval(cathode_boundary(24), 0);
vacuumchamber(18) = nrbline(p1, p2);

% bottom front horizontal
p1 = nrbeval(cathode_boundary(1), 0);
p2 = nrbeval(vacuumchamber(1), 0);
vacuumchamber(19) = nrbline(p1, p2);
end
