function [back_ptcs] = fill_backcathode (cathode_boundary)
% upper diagonal
p1 = nrbeval(cathode_boundary(4), 0.27);
p2 = nrbeval(cathode_boundary(4), 0.3);
p3 = nrbeval(cathode_boundary(4), 0.1);
p2 = [p3(1) p2(2)];
back_ptcs(1) = nrbline(p1, p2);

% lower diagonal
p1 = nrbeval(cathode_boundary(4), 0.69);
p2 = nrbeval(cathode_boundary(4), 0.66);
p3 = nrbeval(cathode_boundary(4), 0.9);
p2 = [p3(1) p2(2)];
back_ptcs(2) = nrbline(p1, p2);

% center vertical
p1 = nrbeval(back_ptcs(2), 1);
p2 = nrbeval(back_ptcs(1), 1);
back_ptcs(3) = nrbline(p1, p2);

% right vertical
p1 = nrbeval(cathode_boundary(5), 0.01);
p2 = nrbeval(cathode_boundary(3), 0.01);
back_ptcs(4) = nrbline(p1, p2);

% upper right diagonal
p1 = nrbeval(back_ptcs(3), 1);
p2 = nrbeval(back_ptcs(4), 0.85);
back_ptcs(5) = nrbline(p1, p2);

% lower right diagonal
p1 = nrbeval(back_ptcs(3), 0);
p2 = nrbeval(back_ptcs(4), 0.15);
back_ptcs(6) = nrbline(p1, p2);
end
