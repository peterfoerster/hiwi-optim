function [electrode_ptcs] = fill_electrode (electrode_boundary)
% FRONT:
% bottom diagonal
p1 = nrbeval(electrode_boundary(9), 1);
p2 = nrbeval(electrode_boundary(1), 1);
electrode_ptcs(1) = nrbline(p1, p2);

% front horizontal
p2 = nrbeval(electrode_boundary(2), 1);
p1 = nrbeval(electrode_boundary(11), 0.8);
p1 = [p1(1) p2(2)];
electrode_ptcs(2) = nrbline(p1, p2);

% center diagonal
p1 = nrbeval(electrode_boundary(9), 1);
p2 = nrbeval(electrode_ptcs(2), 0);
electrode_ptcs(3) = nrbline(p1, p2);

% top front vertical
p2 = nrbeval(electrode_boundary(3), 1);
p1 = nrbeval(electrode_boundary(3), 0.3);
p1 = [p2(1) p1(2)];
electrode_ptcs(4) = nrbline(p1, p2);

% top diagonal
p1 = nrbeval(electrode_ptcs(2), 0);
p2 = nrbeval(electrode_ptcs(4), 0);
electrode_ptcs(5) = nrbline(p1, p2);

% bottom vertical
p1 = nrbeval(electrode_boundary(9), 1);
p2 = nrbeval(electrode_ptcs(2), 0);
p2 = [p1(1) p2(2)];
electrode_ptcs(6) = nrbline(p1, p2);

% top back diagonal
p1 = nrbeval(electrode_ptcs(6), 1);
p2 = nrbeval(electrode_ptcs(4), 0);
electrode_ptcs(7) = nrbline(p1, p2);

% top vertical
p1 = nrbeval(electrode_ptcs(6), 1);
p2 = nrbeval(electrode_boundary(4), 0);
electrode_ptcs(8) = nrbline(p1, p2);

% BACK:
% top horizontal
p1 = nrbeval(electrode_boundary(6), 1);
p2 = nrbeval(electrode_boundary(6), 0.4);
p2 = [p2(1) p1(2)];
electrode_ptcs(9) = nrbline(p1, p2);

% top vertical
p1 = nrbeval(electrode_boundary(6), 0.7);
p2 = nrbeval(electrode_boundary(6), 0);
p1 = [p2(1) p1(2)];
electrode_ptcs(10) = nrbline(p1, p2);

% top diagonal
p1 = nrbeval(electrode_ptcs(9), 1);
p2 = nrbeval(electrode_ptcs(10), 0);
electrode_ptcs(11) = nrbline(p1, p2);

% bottom horizontal
p1 = nrbeval(electrode_boundary(8), 0);
p2 = nrbeval(electrode_boundary(8), 0.6);
p2 = [p2(1) p1(2)];
electrode_ptcs(12) = nrbline(p1, p2);

% back vertical
p1 = nrbeval(electrode_ptcs(12), 1);
p2 = nrbeval(electrode_ptcs(9), 1);
electrode_ptcs(13) = nrbline(p1, p2);

% bottom vertical
p1 = nrbeval(electrode_boundary(8), 1);
p2 = nrbeval(electrode_boundary(8), 0.3);
p2 = [p1(1) p2(2)];
electrode_ptcs(14) = nrbline(p1, p2);

% bottom diagonal
p1 = nrbeval(electrode_ptcs(12), 1);
p2 = nrbeval(electrode_ptcs(14), 1);
electrode_ptcs(15) = nrbline(p1, p2);

% front vertical
p1 = nrbeval(electrode_ptcs(14), 1);
p2 = nrbeval(electrode_ptcs(10), 0);
electrode_ptcs(16) = nrbline(p1, p2);
end
