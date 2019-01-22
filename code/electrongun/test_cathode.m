p1 = [0 0 0];
p2 = [0 1 0];
crv = nrbline(p1, p2);
hold on;
nrbkntplot(crv);

%crv = nrbkntins(crv, [0 1/2 0]);
%nrbctrlplot(crv);

crv = nrbdegelev(crv, 1);
nrbctrlplot(crv);

crv = nrbmodp (crv, [-0.4 0 0], 2);
nrbctrlplot(crv);
