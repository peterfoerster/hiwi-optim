function [v] = compute_lineu(u, crv)
   x0 = nrbeval(crv, 0);
   x1 = nrbeval(crv, 1);
   a = (x1(2)-x0(2))/(x1(1)-x0(1));
   b = x0(2) - a*x0(1);
   v = a*u + b;
end
