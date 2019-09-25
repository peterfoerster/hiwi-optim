function [vacuumchamber_inside] = divide_vacuumchamber_v3 (electrode_boundary, vacuumchamber)
  % bottom front vertical
  p1 = nrbeval(vacuumchamber(25), 1);
  p2 = nrbeval(electrode_boundary(1), 1);
  p2 = [p1(1) p2(2)];
  vacuumchamber_inside(1) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(1), 1);
  p2 = nrbeval(vacuumchamber_inside(1), 1);
  vacuumchamber_inside(2) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(2), 1);
  p2 = nrbeval(vacuumchamber(1), 1);
  vacuumchamber_inside(3) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(1), 1);
  p2 = nrbeval(electrode_boundary(2), 1);
  p3 = nrbeval(vacuumchamber(2), 1);
  p2 = [(p3(1)+p2(1))/2 p2(2)];
  vacuumchamber_inside(4) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(2), 1);
  p2 = nrbeval(vacuumchamber_inside(4), 1);
  vacuumchamber_inside(5) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(4), 1);
  p2 = nrbeval(vacuumchamber(2), 1);
  vacuumchamber_inside(6) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(4), 1);
  p2 = nrbeval(electrode_boundary(3), 1);
  p3 = nrbeval(vacuumchamber(3), 1);
  p2 = [(p3(1)+p2(1))/2 p2(2)];
  vacuumchamber_inside(7) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(3), 1);
  p2 = nrbeval(vacuumchamber_inside(7), 1);
  vacuumchamber_inside(8) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(7), 1);
  p2 = nrbeval(vacuumchamber(3), 1);
  vacuumchamber_inside(9) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(7), 1);
  p2 = nrbeval(electrode_boundary(4), 1);
  p3 = nrbeval(vacuumchamber(4), 1);
  p2 = [(p3(1)+p2(1))/2 (p3(2)+p2(2))/2];
  vacuumchamber_inside(10) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(4), 1);
  p2 = nrbeval(vacuumchamber_inside(10), 1);
  vacuumchamber_inside(11) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(10), 1);
  p2 = nrbeval(vacuumchamber(4), 1);
  vacuumchamber_inside(12) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(10), 1);
  p2 = nrbeval(electrode_boundary(5), 1);
  p3 = nrbeval(vacuumchamber(5), 1);
  p2 = [(p3(1)+p2(1))/2 (p3(2)+p2(2))/2];
  vacuumchamber_inside(13) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(5), 1);
  p2 = nrbeval(vacuumchamber_inside(13), 1);
  vacuumchamber_inside(14) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(13), 1);
  p2 = nrbeval(vacuumchamber(5), 1);
  vacuumchamber_inside(15) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(13), 1);
  p2 = nrbeval(electrode_boundary(6), 1);
  p3 = nrbeval(vacuumchamber(6), 1);
  p2 = [(p3(1)+p2(1))/2 (4*p3(2)+p2(2))/5];
  vacuumchamber_inside(16) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(6), 1);
  p2 = nrbeval(vacuumchamber_inside(16), 1);
  vacuumchamber_inside(17) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(16), 1);
  p2 = nrbeval(vacuumchamber(6), 1);
  vacuumchamber_inside(18) = nrbline(p1, p2);

  % top front vertical
  p1 = nrbeval(vacuumchamber_inside(16), 1);
  p2 = nrbeval(vacuumchamber(9), 1);
  vacuumchamber_inside(19) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(6), 1);
  p2 = nrbeval(vacuumchamber(9), 0);
  vacuumchamber_inside(20) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(7), 0);
  p2 = nrbeval(vacuumchamber(10), 0);
  vacuumchamber_inside(21) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(8), 0);
  p2 = nrbeval(vacuumchamber(11), 0);
  vacuumchamber_inside(22) = nrbline(p1, p2);

  % holes
  p1 = nrbeval(electrode_boundary(9), 0);
  p2 = nrbeval(vacuumchamber(12), 0);
  vacuumchamber_inside(23) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(10), 0);
  p2 = nrbeval(vacuumchamber(13), 0);
  vacuumchamber_inside(24) = nrbline(p1, p2);

  % upper left corner and curvature
  p1 = nrbeval(electrode_boundary(11), 1);
  p2 = nrbeval(vacuumchamber(13), 0);
  p1 = [2/3*p1(1) (2*p1(2)+p2(2))/3];
  vacuumchamber_inside(25) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(25), 0);
  p2 = nrbeval(vacuumchamber(14), 0);
  p1 = [2/3*p2(1) p1(2)];
  vacuumchamber_inside(26) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(25), 0);
  p2 = nrbeval(electrode_boundary(12), 1);
  vacuumchamber_inside(27) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(26), 0);
  p2 = nrbeval(vacuumchamber_inside(25), 0);
  vacuumchamber_inside(28) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(16), 0);
  p2 = nrbeval(vacuumchamber_inside(26), 0);
  vacuumchamber_inside(29) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(12), 0);
  p2 = nrbeval(vacuumchamber_inside(25), 0);
  p1 = [3/5*p1(1) 8/7*p1(2)];
  vacuumchamber_inside(30) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(12), 0);
  p2 = nrbeval(vacuumchamber_inside(26), 0);
  p1 = [2/5*p1(1) 8/7*p1(2)];
  vacuumchamber_inside(31) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(30), 0);
  p2 = nrbeval(electrode_boundary(12), 0);
  vacuumchamber_inside(32) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(31), 0);
  p2 = nrbeval(vacuumchamber_inside(30), 0);
  vacuumchamber_inside(33) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(17), 0);
  p2 = nrbeval(vacuumchamber_inside(31), 0);
  vacuumchamber_inside(34) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(15), 1);
  p2 = nrbeval(vacuumchamber_inside(30), 0);
  vacuumchamber_inside(35) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(15), 1);
  p2 = nrbeval(vacuumchamber_inside(31), 0);
  p1 = [p1(1)/2 p1(2)];
  vacuumchamber_inside(36) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(36), 0);
  p2 = nrbeval(electrode_boundary(15), 1);
  vacuumchamber_inside(37) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(18), 0);
  p2 = nrbeval(vacuumchamber_inside(36), 0);
  vacuumchamber_inside(38) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(19), 0);
  p2 = nrbeval(vacuumchamber_inside(36), 0);
  p1 = [p2(1) p1(2)];
  vacuumchamber_inside(39) = nrbline(p1, p2);

  % top insulator
  p1 = nrbeval(vacuumchamber(19), 0);
  p2 = nrbeval(vacuumchamber_inside(39), 0);
  vacuumchamber_inside(40) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(39), 0);
  p2 = nrbeval(electrode_boundary(15), 0);
  vacuumchamber_inside(41) = nrbline(p1, p2);

  % bottom insulator
  p1 = nrbeval(vacuumchamber(21), 0);
  p2 = [6e-3 16e-3];
  vacuumchamber_inside(42) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(42), 1);
  p2 = [16e-3, 21e-3];
  vacuumchamber_inside(43) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(43), 1);
  p2 = nrbeval(electrode_boundary(25), 1);
  vacuumchamber_inside(44) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(21), 1);
  p2 = nrbeval(vacuumchamber_inside(43), 1);
  vacuumchamber_inside(45) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(42), 1);
  p2 = nrbeval(electrode_boundary(25), 0);
  vacuumchamber_inside(46) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(23), 1);
  p2 = nrbeval(electrode_boundary(26), 1);
  vacuumchamber_inside(47) = nrbline(p1, p2);

  % between insulators
  p1 = nrbeval(vacuumchamber_inside(45), 1);
  p2 = nrbeval(vacuumchamber_inside(39), 0);
  vacuumchamber_inside(48) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber_inside(44), 1);
  p2 = nrbeval(electrode_boundary(15), 0);
  vacuumchamber_inside(49) = nrbline(p1, p2);

  % cable
  p1 = nrbeval(electrode_boundary(24), 1);
  p2 = nrbeval(electrode_boundary(16), 1);
  vacuumchamber_inside(50) = nrbline(p1, p2);

  % lift
  p1 = nrbeval(electrode_boundary(23), 1);
  p2 = nrbeval(electrode_boundary(21), 1);
  vacuumchamber_inside(51) = nrbline(p1, p2);

  p1 = nrbeval(electrode_boundary(16), 1);
  p2 = nrbeval(electrode_boundary(20), 1);
  vacuumchamber_inside(52) = nrbline(p1, p2);
end
