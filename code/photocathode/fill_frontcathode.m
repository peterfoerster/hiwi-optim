function [front_ptcs] = fill_frontcathode (cathode_boundary)
% bottom diagonal
p1 = nrbeval(cathode_boundary(5), 1);
p2 = nrbeval(cathode_boundary(1), 1);
front_ptcs(1) = nrbline(p1, p2);

% center horizontal
p2 = nrbeval(cathode_boundary(2), 0.35);
p1 = nrbeval(cathode_boundary(7), 0.8);
p1 = [p1(1) p2(2)];
front_ptcs(2) = nrbline(p1, p2);

% center diagonal
p1 = nrbeval(cathode_boundary(5), 1);
p2 = nrbeval(front_ptcs(2), 0);
front_ptcs(3) = nrbline(p1, p2);

% top vertical
p2 = nrbeval(cathode_boundary(2), 1);
p1 = nrbeval(cathode_boundary(2), 0.63);
p1 = [p2(1) p1(2)];
front_ptcs(4) = nrbline(p1, p2);

% top diagonal
p1 = nrbeval(front_ptcs(4), 0);
p2 = nrbeval(front_ptcs(2), 0);
front_ptcs(5) = nrbline(p1, p2);

% bottom left vertical
p1 = nrbeval(cathode_boundary(5), 1);
p2 = nrbeval(front_ptcs(2), 0);
p2 = [p1(1) p2(2)];
front_ptcs(6) = nrbline(p1, p2);

% top left vertical
p1 = nrbeval(front_ptcs(6), 1);
p2 = nrbeval(cathode_boundary(2), 1);
p2 = [p1(1) p2(2)];
front_ptcs(7) = nrbline(p1, p2);

% top left diagonal
p1 = nrbeval(front_ptcs(6), 1);
p2 = nrbeval(front_ptcs(4), 0);
front_ptcs(8) = nrbline(p1, p2);
end
