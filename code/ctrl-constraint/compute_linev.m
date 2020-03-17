function [u] = compute_linev(v, crv)
   x0 = nrbeval(crv, 0);
   x1 = nrbeval(crv, 1);
   a = (x1(2)-x0(2))/(x1(1)-x0(1));
   b = x0(2) - a*x0(1);
   u = (v-b)/a;
end
