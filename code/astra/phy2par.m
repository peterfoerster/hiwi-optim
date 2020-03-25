function [x] = phys2param ()
   % transform physical to parametric coordinates
   % patch 6,4,3,2,1
   pt(19) = nrbinverse(nrb_opt, nrbeval(crv(19), 1), 'Display', 'false');
