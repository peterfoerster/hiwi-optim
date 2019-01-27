function [cathode_ptcs] = fill_cathode (cathode)
% front horizontal
p1 = nrbeval(cathode(6), 1);
p2 = nrbeval(cathode(1), 1);
p1 = [p1(1) p2(2)];
cathode_ptcs(1) = nrbline(p1, p2);

% bottom vertical
p1 = nrbeval(cathode(6), 1);
p2 = nrbeval(cathode_ptcs(1), 0);
cathode_ptcs(2) = nrbline(p1, p2);

% top vertical
p1 = nrbeval(cathode_ptcs(2), 1);
p2 = nrbeval(cathode(3), 1);
cathode_ptcs(3) = nrbline(p1, p2);

% back horizontal
p1 = nrbeval(cathode(5), 1);
p2 = nrbeval(cathode_ptcs(1), 0);
cathode_ptcs(4) = nrbline(p1, p2);
end
