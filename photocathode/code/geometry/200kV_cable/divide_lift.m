function [lift_inside] = divide_lift (cathode_boundary, vacuumchamber)
  p1 = nrbeval(cathode_boundary(22), 1);
  p2 = nrbeval(cathode_boundary(1), 1);
  lift_inside(1) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(18), 1);
  p2 = nrbeval(cathode_boundary(2), 1);
  p3 = nrbeval(cathode_boundary(4), 0);
  p4 = nrbeval(cathode_boundary(18), 0);
  p1 = [(p1(1)+p4(1))/2 (p2(2)+p3(2))/2];
  lift_inside(2) = nrbline(p1, p2);

  p1 = nrbeval(lift_inside(2), 0);
  p2 = nrbeval(cathode_boundary(18), 1);
  lift_inside(3) = nrbline(p1, p2);

  p1 = nrbeval(lift_inside(1), 0);
  p2 = nrbeval(lift_inside(2), 0);
  lift_inside(4) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(22), 1);
  p2 = nrbeval(cathode_boundary(19), 0);
  lift_inside(5) = nrbline(p1, p2);

  p1 = nrbeval(vacuumchamber(16), 1);
  p2 = nrbeval(cathode_boundary(22), 1);
  lift_inside(6) = nrbline(p1, p2);
end
