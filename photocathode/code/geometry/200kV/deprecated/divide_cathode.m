function [cathode_inside] = divide_cathode (cathode_boundary)
  % bottom front horizontal
  p1 = nrbeval(cathode_boundary(17), 0);
  p2 = nrbeval(cathode_boundary(4), 0);
  cathode_inside(1) = nrbline(p1, p2);

  p1 = nrbeval(cathode_inside(1), 0);
  p2 = nrbeval(cathode_boundary(4), 1);
  p3 = nrbeval(cathode_inside(1), 1);
  p2 = [(p1(1)+p3(1))/2 p2(2)];
  cathode_inside(2) = nrbline(p1, p2);

  p1 = nrbeval(cathode_inside(2), 1);
  p2 = nrbeval(cathode_boundary(4), 1);
  cathode_inside(3) = nrbline(p1, p2);

  p1 = nrbeval(cathode_inside(3), 0);
  p2 = nrbeval(cathode_boundary(16), 1);
  p2 = [p1(1) p2(2)];
  cathode_inside(4) = nrbline(p1, p2);

  p1 = nrbeval(cathode_inside(4), 1);
  p2 = nrbeval(cathode_boundary(5), 1);
  cathode_inside(5) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(16), 1);
  p2 = nrbeval(cathode_inside(4), 1);
  cathode_inside(6) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(16), 1);
  p2 = nrbeval(cathode_boundary(6), 0);
  cathode_inside(7) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(15), 1);
  p2 = nrbeval(cathode_boundary(6), 0);
  p3 = nrbeval(cathode_boundary(9), 1);
  p1 = [p1(1) p3(2)];
  cathode_inside(8) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(15), 1);
  p2 = nrbeval(cathode_inside(8), 0);
  cathode_inside(9) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(9), 1);
  p2 = nrbeval(cathode_inside(9), 1);
  cathode_inside(10) = nrbline(p1, p2);

  p1 = nrbeval(cathode_boundary(12), 1);
  p2 = nrbeval(cathode_boundary(10), 1);
  cathode_inside(11) = nrbline(p1, p2);
end
