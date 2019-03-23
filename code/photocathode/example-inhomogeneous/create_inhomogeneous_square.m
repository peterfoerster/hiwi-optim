function [crv] = create_inhomogeneous_square ()
% left box
p1 = [0 0 0];
p2 = [1 0 0];
crv(1) = nrbline(p1, p2);

p1 = nrbeval(crv(1), 1);
p2 = [1 1 0];
crv(2) = nrbline(p1, p2);

p1 = [0 1 0];
p2 = nrbeval(crv(2), 1);
crv(3) = nrbline(p1, p2);

p1 = nrbeval(crv(1), 0);
p2 = nrbeval(crv(3), 0);
crv(4) = nrbline(p1, p2);

% right box
p1 = nrbeval(crv(1), 1);
p2 = [2 0 0];
crv(5) = nrbline(p1, p2);

p1 = nrbeval(crv(5), 1);
p2 = [2 1 0];
crv(6) = nrbline(p1, p2);

p1 = nrbeval(crv(3), 1);
p2 = nrbeval(crv(6), 1);
crv(7) = nrbline(p1, p2);

srf(1) = nrbcoons(crv(4), crv(2), crv(1), crv(3));
srf(2) = nrbcoons(crv(2), crv(6), crv(5), crv(7));

[interfaces, boundaries] = nrbmultipatch (srf);
boundaries = [];

boundaries(1).patches = [1];
boundaries(1).faces   = [3];

boundaries(2).patches = [2];
boundaries(2).faces   = [4];

boundaries(3).patches = [1 1 2 2];
boundaries(3).faces   = [1 2 1 2];

for ibnd = 1:length(boundaries)
    boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
end

nrbexport (srf, interfaces, boundaries, 'inhomogeneous_square.txt');
end
