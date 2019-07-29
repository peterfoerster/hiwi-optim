function [vacuumchamber_inside] = divide_vacuumchamber (cathode_boundary, vacuumchamber)
  % bottom front horizontal
  p1 = nrbeval(cathode_boundary(1), 1);
  p2 = nrbeval(vacuumchamber(1), 1);
  vacuumchamber_inside(1) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(2), 1);
  p2 = nrbeval(vacuumchamber(2), 1);
  vacuumchamber_inside(2) = nrbline(p1, p2);

  % front diagonal
  p1 = nrbeval(cathode_boundary(3), 1);
  p2 = nrbeval(vacuumchamber(3), 1);
  vacuumchamber_inside(3) = nrbline(p1, p2);

  % top diagonal
  p1 = nrbeval(cathode_boundary(4), 0);
  p2 = nrbeval(vacuumchamber(4), 0);
  vacuumchamber_inside(4) = nrbline(p1, p2);

  % top back diagonal
  p1 = nrbeval(cathode_boundary(5), 0);
  p2 = nrbeval(vacuumchamber(5), 0);
  vacuumchamber_inside(5) = nrbline(p1, p2);

  % top back horizontal
  p1 = nrbeval(vacuumchamber(6), 0);
  p2 = nrbeval(cathode_boundary(6), 0);
  vacuumchamber_inside(6) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(7), 0);
  p2 = nrbeval(cathode_boundary(7), 0);
  vacuumchamber_inside(7) = nrbline(p1, p2);

  % center back horizontal
  p1 = nrbeval(vacuumchamber(8), 0);
  p2 = nrbeval(cathode_boundary(8), 0);
  vacuumchamber_inside(8) = nrbline(p1, p2);

  % bottom back horizontal
  p1 = nrbeval(vacuumchamber(9), 0);
  p2 = nrbeval(cathode_boundary(16), 1);
  vacuumchamber_inside(9) = nrbline(p1, p2);

  % center vertical
  p1 = nrbeval(cathode_boundary(16), 1);
  p2 = nrbeval(cathode_boundary(8), 0);
  vacuumchamber_inside(10) = nrbline(p1, p2);

  % center diagonals
  p1 = nrbeval(cathode_boundary(15), 1);
  p2 = nrbeval(cathode_boundary(9), 1);
  vacuumchamber_inside(11) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(10), 1);
  p2 = nrbeval(cathode_boundary(13), 0);
  vacuumchamber_inside(12) = nrbline(p1, p2);
end
